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

userSave = (username, password)=>
  myStore.dispatch actions.userSave
    user:
      username: username
      password: password
      
userPatch = (username, password)=>
  myStore.dispatch actions.userPatch
    objectId: myStore.getState().adminBe.user[0].objectId
    username: username
    password: password
    
userSaveAll = =>
  myStore.dispatch actions.userSaveAll
    user: []

userRemove = =>
  myStore.dispatch actions.userRemove
    objectId: myStore.getState().adminBe.user[0].objectId

export {
  staticFuc
  userSave
  userPatch
  userSaveAll
  userRemove
}