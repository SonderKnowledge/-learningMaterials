import dd from 'ddeyes'

export default ({
  type
  service
}) ->
  create: (
    { payload }
    { put }
  ) ->
    data = yield service.tenant.create payload
      
    if data?
      yield put
        type: type.save
        payload:
          tenants: data
      yield payload.success data
    else
      yield payload.fail 'create error'

    return

  fetch: (
    { payload }
    { put }
  ) ->
    data = yield service.tenant.fetch payload

    if data?
      yield put
        type: type.save
        payload:
          tenants: data
      yield payload.success data
    else
      yield payload.fail 'fetch error'

    return

  reload: (
    { payload }
    { put }
  ) ->
    data = yield service.tenant.fetchAll payload
      
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
          tenants: data
      
      for i in [0...allParams.length-1]
        yield put 
          type: type.userSave
          payload: 
            users: allParams[i]
            
      yield payload.success data
    else
      yield payload.fail 'reload error'

    return
  
  update: (
    { payload }
    { put }
  ) ->
    data = yield service.tenant.update payload

    params = yield service.tenant.fetch data

    if data? and params?
      yield put
        type: type.patch
        payload:
          tenants: params
      yield payload.success params
    else
      yield payload.fail 'update error'
    
    return
  
  delete: (
    { payload }
    { put }
  ) ->
    # 删除房客的同时还要删除房客在 person的公有信息
    tenant = yield service.tenant.delete payload

    newPayload = {
      objectId: payload.userId
    }
    # 删除房客在person的公有信息
    user = yield service.user.delete newPayload

    if user? and tenant?
      yield put
        type: type.remove
        payload:
          tenants: payload
      yield put
        type: type.userRemove
        payload:
          users: newPayload
      yield payload.success 'ok'
    else
      yield payload.fail 'update error'
    
    return