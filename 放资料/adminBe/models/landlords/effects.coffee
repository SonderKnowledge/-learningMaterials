import dd from 'ddeyes'

export default ({
  type
  service
}) ->
  create: (
    { payload }
    { put }
  ) ->
    data = yield service.landlord.create payload

    if data?
      yield put 
        type: type.save
        payload: 
          landlords: data
      yield payload.success data
    else
      yield payload.fail 'create error'
    
    return 
    
  update: (
    { payload }
    { put }
  ) ->
    data = yield service.landlord.update payload

    params = yield service.landlord.fetch data

    if data?
      yield put 
        type: type.patch
        payload: 
          landlords: params
      yield payload.success data
    else
      yield payload.fail 'update error'
    
  delete: (
    { payload }
    { put }
  ) ->
    # 删除房东的同时还要删除房东在person的公有信息
    # 删除房东的私有信息
    landlord = yield service.landlord.delete payload

    newPayload = {
      objectId: payload.userId
    }

    # 删除房东在person的公有信息
    user = yield service.user.delete newPayload

    if landlord? and user?
      yield put 
        type: type.remove
        payload: 
          landlords: payload
      yield put 
        type: type.userRemove
        payload: 
          users: newPayload
      yield payload.success 'ok'
    else
      yield payload.fail 'delete error'
    
    return 
  
  reload: (
    { payload }
    { put }
  ) ->
    data = yield service.landlord.fetchAll payload
    
    ids = data.results.reduce (r, c) =>
      [
        r...
        c.userId
      ]
    , []

    allParams = 
      for id in ids
        yield service.user.fetch {
          objectId: id
        }
          
    if data? and allParams?
      yield put 
        type: type.saveAll
        payload: 
          landlords: data

      for i in [0...allParams.length-1]
        yield put 
          type: type.userSave
          payload: 
            users: allParams[i]
            
      yield payload.success data
    else
      yield payload.fail 'reload error'
    
    return 
