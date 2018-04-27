import dd from 'ddeyes'

export default ({
  type
  service
}) ->
  # 创建自然人
  create: (
    { payload }
    { put }
  ) ->
    data = yield service.user.create payload

    if data?
      yield put
        type: type.save
        payload:
          users: data
      yield payload.success data
    else
      yield payload.fail 'create error'

    return

  # 查找单个用户
  fetch: (
    { payload }
    { put }
  ) ->
    data = yield service.user.fetch payload  

    if data?
      yield put
        type: type.save
        payload:
          users: data
      yield payload.success data
    else
      yield payload.fail 'fetch error'

    return

  # 查找全部用户
  reload: (
    { payload }
    { put }
  ) ->
    data = yield service.user.fetchAll payload  

    if data?
      yield put 
        type: type.saveAll
        payload: 
          users: data
      yield payload.success data
    else
      yield payload.fail 'login error'

    return
  
  # 验证邮箱
  verEmail: (
    { payload }
    { put }
  ) ->
    data = yield service.user.verEmail payload
    
    if data?
      yield payload.success data
    else
      yield payload.fail 'verEmail error'
    
    return
  
  # 用邮箱改密码
  resetPsdWithEmail: (
    { payload }
    { put }
  ) ->
    data = yield service.user.resetPsdWithEmail payload
    
    if data?
      yield payload.success data
    else
      yield payload.fail 'resetPsdWithEmail error'
    
    return 
  
  # 用旧密码换新密码
  resetPsd: (
    { payload }
    { put }
  ) ->
    data = yield service.user.resetPsd payload
    
    if data?
      yield payload.success data
    else
      yield payload.fail 'resetPsd error'
    
    return
  
  # 更新用户信息
  update: (
    { payload }
    { put }
  ) ->
    data = yield service.user.update payload

    params = yield service.user.fetch data

    if data?
      yield put
        type: type.patch
        payload:
          users: params
      yield payload.success params
    else
      yield payload.fail 'update error'
    
    return

  # 更新用户的token
  resetSessionToken: (
    { payload }
    { put }
  ) ->
    data = yield service.user.resetSessionToken payload
    
    if data?
      yield payload.success data
    else
      yield payload.fail 'resetSessionToken fail'
    
    return
  
  # 删除用户
  delete: (
    { payload }
    { put }
  ) ->
    data = yield service.user.delete payload
    
    results = yield service.user.fetchAll ''
    
    if results?
      yield put
        type: type.saveAll
        payload:
          users: results
      yield payload.success results
    else
      yield payload.fail 'delete error'
    
    return
    

  