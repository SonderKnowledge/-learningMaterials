import dd from 'ddeyes'

export default ({
  type
  service
}) ->
  signup: (
    { payload }
    { put }
  ) ->
    params = 
      username: payload.username
      password: payload.password
      isFrozen: false

    data = yield service.login.signup params

    return

  # 登录
  login: (
    { payload }
    { put }
  ) ->
    data = yield service.login.login payload

    if data?
      yield put 
        type: type.save
        payload: 
          login: data
      yield payload.success data
    else
      yield payload.fail 'login error'

    return