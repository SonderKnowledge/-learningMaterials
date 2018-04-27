import dd from 'ddeyes'

export default ({
  type
  service
}) ->
  create: (
    { payload }
    { put }
  ) ->
    data = yield service.todo.create payload

    if data?
      yield put
        type: type.save
        payload:
          todo: data
      yield payload.success data
    else
      yield payload.fail 'create error'
    
    return
  
  fetch: (
    { payload }
    { put }
  ) ->
    data = yield service.todo.fetch payload

    if data?
      yield put
        type: type.saveAll
        payload: 
          todo: data
      yield payload.success data
    else
      yield payload.fail 'fetch error'
    
    return
  
  reload: (
    { payload }
    { put }
  ) ->
    data = yield service.todo.fetchAll payload

    if data?
      yield put 
        type: type.saveAll
        payload: 
          todo: data
      yield payload.success data
    else
      yield payload.fail 'reload error'

    return

  update: (
    { payload }
    { put }
  ) ->
    data = yield service.todo.update payload

    params = yield service.todo.fetch data

    if data?
      yield put
        type: type.patch
        payload:
          todo: params #params.results[0]
      yield payload.success params # params.results[0]
    else
      yield payload.fail 'update error'
    
    return
  
  delete: (
    { payload }
    { put }
  ) ->
    data = yield service.todo.delete payload

    params = yield service.todo.fetchAll payload

    if data?
      yield put 
        type: type.saveAll
        payload: 
          todo: params
      yield payload.success data
    else
      yield payload.fail 'delete error'

    return