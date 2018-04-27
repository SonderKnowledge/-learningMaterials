import dd from 'ddeyes'

export default ({
  type
  service
}) ->
  create: (
    { payload }
    { put }
  ) ->
    data = yield service.notice.create payload

    if data?
      yield put 
        type: type.save
        payload: 
          notice: data
      yield payload.success data
    else
      yield payload.fail 'create error'
    
    return 
    
  update: (
    { payload }
    { put }
  ) ->
    data = yield service.notice.update payload
      
    params = yield service.notice.fetch data

    if data?
      yield put 
        type: type.patch
        payload: 
          notice: params
      yield payload.success data
    else
      yield payload.fail 'update error'
    
  delete: (
    { payload }
    { put }
  ) ->
    data = yield service.notice.delete payload

    if data?
      yield put 
        type: type.remove
        payload: 
          notice: payload
      yield payload.success data
    else
      yield payload.fail 'delete error'

    return
  
  reload: (
    { payload }
    { put }
  ) ->
    data = yield service.notice.fetchAll payload

    if data?
      yield put 
        type: type.saveAll
        payload: 
          notice: data
      yield payload.success data
    else
      yield payload.fail 'reload error'

    return
