import dd from 'ddeyes'
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
    sync: =>
      dd myStore.getState()
}

login = (
  { 
    user
    token
  }
) =>
  myStore.dispatch actions.loginSave
    login: {
      user
      token
    }


signout = =>
  myStore.dispatch actions.loginSignout
    login: ''

export {
  login
  signout
}