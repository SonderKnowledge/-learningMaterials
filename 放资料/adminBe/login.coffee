import dd from 'ddeyes'
import { promiseWrapper } from '../utils/promiseWrapper'

# 注册
loginSignup = (
  {
    username
    password
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.loginSignup
    actionParams: {
      username
      password
    }
  }

# 登录
loginLogin = (
  {
    username
    password
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.loginLogin
    actionParams: {
      username
      password
    }
  }
    
export {
  loginSignup
  loginLogin
}


import dd from 'ddeyes'
import services from '../../utils/services'
import {
  generateToken
  verifyToken
  refreshToken
} from '../../utils/jsonWebToken'

export default (app) ->
  class LoginService extends app.Service
    constructor: (ctx) ->
      super ctx
      @
      # @services = app.dbServices.Login
      # @personServices = app.dbServices.Person

    signup: (data) ->
      result = await services.Login.register data
      # isDelete = false
      # username = data.username
      # personResult = await @personServices.create { username, isDelete }
      # personId = personResult.objectId
      # result = await @services.register {
      #   data...
      #   personId
      # }

    login: (data) ->
      result = await services.Login.login data
      # user = await @services.login data

      # # 生成jsonwebtoken
      # token = generateToken(
      #   user.objectId
      #   user.sessionToken
      # )
      # # 对返回的数据进行处理干掉敏感信息
      # if user?.objectId?
      #   delete user.objectId
      # if user?.sessionToken?
      #   delete user.sessionToken
      # if user?.updatedAt?
      #   delete user.updatedAt
      # if user?.createdAt?
      #   delete user.createdAt

      # # 返回的数据
      # return {
      #   user
      #   token
      # }
    
    resetPsd: (data) ->
      # result = await @services.resetPsd data
      result = await services.Login.resetPsd data


import services from '../../utils/services'

export default (app) ->
  class LoginService extends app.Service
    constructor: (ctx) ->
      super ctx
      @

    signup: (data) ->
      result = await services.Login.register data

    login: (data) ->
      result = await services.Login.login data
    
    resetPsd: (data) ->
      result = await services.Login.resetPsd data
