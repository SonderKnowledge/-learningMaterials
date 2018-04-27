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

userSave = ({ users }) =>
  myStore.dispatch actions.userSave
    users: users

userPatch = ({ users }) =>
  myStore.dispatch actions.userPatch
    users: users

userSaveAll = ({ users }) =>
  myStore.dispatch actions.userSaveAll
    users: users

userRemove = ({ users })=>
  myStore.dispatch actions.userRemove
    users: users

userRemoveAll = =>
  myStore.dispatch actions.userRemoveAll
    users: []

export {
  userSave  
  userPatch
  userSaveAll
  userRemove
  userRemoveAll
}