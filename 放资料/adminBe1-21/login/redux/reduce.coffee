import dd from 'ddeyes'
import uuid from '../../../src/utils/uuidTool'
import * as store from '../../../src/store'

{
  constants
  actions
  reducers
  getStore
} = store

myStore = getStore {
  appName: 'adminBe'
  reducers
  subscriber:
    sync: ->
      dd myStore.getState()
}

staticFuc = =>
  dd {
    constants
    actions
  }

loginReduce = (
  username
  password
)=>
  myStore.dispatch actions.loginLogin
    login:    
      username: username
      password: password

signout = =>
  myStore.dispatch actions.loginSignout
    login: ''

export {
  staticFuc
  loginReduce
  signout
}