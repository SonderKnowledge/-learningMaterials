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
  sagas: sagas.login
  reducers
  subscriber:
    async: subscriber
}

# 用户登录
login = (
  username
  password
) =>
  promiseWapper
    store: myStore
    action: actions.loginLogin
    actionParams: {
      username
      password
    }

export {
  login
}