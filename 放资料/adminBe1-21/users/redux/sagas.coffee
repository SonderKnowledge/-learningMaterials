import dd from 'ddeyes'
import isEqual from 'is-equal'
import * as store from '../../../src/store'
import { promiseWapper } from '../../../src/utils/promiseWapper'

{
  constants
  actions
  sagas
  reducers 
  getStore
} = store

subscriber = (
  prevState
  nextState
  action
  dispatch
) =>
  dd myStore.getState() if not isEqual prevState, nextState
  
myStore = getStore {
  appName: 'adminBe'
  sagas: sagas.user
  reducers
  subscriber:
    async: subscriber
}

# 用户注册
userSignup = (username, password) =>
  promiseWapper
    store: myStore
    action: actions.userSignup
    actionParams: {
      username
      password
    }

# 查找单个用户
userFetch = =>
  promiseWapper
    store: myStore
    action: actions.userFetch
    actionParams: {
      objectId
    }

# 查找全部用户
userReload = =>
  promiseWapper
    store: myStore
    action: actions.userReload

# 验证邮箱
userVerEmail = =>
  promiseWapper
    store: myStore
    action: actions.userVerEmail
    actionParams: { 
      eamil
    }

# 利用邮箱更改密码
userResetPsdWithEmail = (password) =>
  promiseWapper
    store: myStore
    action: actions.userResetPsdWithEmail
    actionParams: {
      eamil
      password
    }

# 用旧密码换新密码
userResetPsd = (old_password, new_password) =>
  promiseWapper
    store: myStore
    action: actions.userResetPsd
    actionParams: {
      old_password
      new_password
    }

# 更新用户信息
userUpdate = (username, password) =>
  promiseWapper
    store: myStore
    action: actions.userUpdate
    actionParams: {
      username
      password
    }

# 更新用户token
userResetSessionToken = =>
  promiseWapper
    store: myStore
    action: actions.userResetSessionToken

# 删除用户
userDelete = =>
  promiseWapper
    store: myStore
    action: actions.userResetSessionToken

export {
  userSignup
  userFetch
  userReload
  userVerEmail
  userResetPsdWithEmail
  userResetPsd
  userUpdate
  userResetSessionToken
  userDelete
}