import dd from 'ddeyes'
import * as store from '../../src/store'

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

loginReduce = ({ user, token })=>
  myStore.dispatch actions.loginLogin
    login: {
      user
      token
    }

signout = =>
  myStore.dispatch actions.loginSignout
    login: ''

userSave = ({ users })=>
  myStore.dispatch actions.userSave
    users: users

userPatch = ({ users })=>
  myStore.dispatch actions.userPatch
    users: users

userSaveAll = (users)=>
  myStore.dispatch actions.userSaveAll
    users: users

userRemove = (users)=>
  myStore.dispatch actions.userRemove
    users: users

userRemoveAll = (user)=>
  myStore.dispatch actions.userRemoveAll
    user: user

landlordSave = ({ landlord })=>
  myStore.dispatch actions.landlordSave
    landlord: landlord
      
landlordPatch = ({ landlord })=>
  myStore.dispatch actions.landlordPatch
    landlord: landlord

landlordSaveAll = ({ landlord })=>
  myStore.dispatch actions.landlordSaveAll
    landlord: landlord

landlordRemove = =>
  myStore.dispatch actions.landlordRemove
    landlord: landlord

landlordRemoveAll = =>
  myStore.dispatch actions.landlordRemoveAll
    landlord: landlord



export {
  loginReduce
  signout
  landlordSave
  landlordPatch
  landlordSaveAll
  landlordRemove
  landlordRemoveAll
  userPatch
  userSave
  userSaveAll
  userRemove
  userRemoveAll
}