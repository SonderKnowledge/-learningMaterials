import dd from 'ddeyes'
import { promiseWrapper } from '../utils/promiseWrapper'

# 创建自然人
userCreate = (
  {
    realName
    sex
    phoneNo
    IDCard
    eamil
    dateBirth
  }
  {
    store
    actions
  }
)=>
  promiseWrapper {
    store
    action: actions.userCreate
    actionParams: {
      realName
      sex
      phoneNo
      IDCard
      eamil
      dateBirth
    }
  }

# 更新用户信息
userUpdate = (
  {
    objectId
    phoneNo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.userUpdate
    actionParams: {
      objectId
      phoneNo
    }
  }

# 查找单个用户
userFetch = (
  {
    objectId
  }
  {
    store
    actions
  }
)=>
  promiseWrapper {
    store
    action: actions.userFetch
    actionParams: {
      objectId
    }
  }


# 查找全部用户
userReload = (
  {
    store
    actions
  }
)=>
  promiseWrapper {
    store
    action: actions.userReload
  }

# 验证邮箱
userVerEmail = (
  {
    eamil
  }
  {
    store
    actions
  }
)=>
  promiseWrapper {
    store
    action: actions.userVerEmail
    actionParams: {
      eamil
    }
  }

# 利用邮箱更改密码
userResetPsdWithEmail = (
  {
    eamil
    password
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.userResetPsdWithEmail
    actionParams: {
      eamil
      password
    }
  }

# 用旧密码换新密码
userResetPsd = (
  {
    old_password
    new_password
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.userResetPsd
    actionParams: {
      old_password
      new_password
    }
  }

# 更新用户token
userResetSessionToken = (
  {}
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.userResetSessionToken
  }

# 删除用户
userDelete = (
  {
    objectId
  }
  {
    store
    actions
  }
)=>
  promiseWrapper {
    store
    action: actions.userDelete
    actionParams: {
      objectId      
    }
  }

export {
  userCreate
  userFetch
  userReload
  userVerEmail
  userResetPsd
  userUpdate
  userDelete
  userResetSessionToken  
  userResetPsdWithEmail
}


## adminBeService user service
import services from '../../utils/services'
export default (app) ->
  class UserService extends app.Service
    constructor: (ctx) ->
      super ctx
      @
      # @services = app.dbServices.Person
      
    create: (data) ->
      result = await @services.create data

    fetch: (data) ->
      result = await services.user.fetch data

    update: (data) ->
      result = await @services.update data

    delete: (data) ->
      result = await @services.delete data

    reload: () ->
      result = await @services.reload()
