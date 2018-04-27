import dd from 'ddeyes'
import reqTool from '../../../src/utils/reqTool'
import * as services from '../../../src/services/users'

signup = (username, password, phoneNo) =>
  data = await services.lc.signup reqTool
  ,
    username: username
    password: password
    phoneNo: phoneNo
  data

login = (username, password) =>
  data = await services.lc.login reqTool
  ,
    username: username
    password: password
  data

fetch = (objectId) =>
  data = await services.lc.fetch reqTool
  ,
    objectId: objectId
  data

fetchAll = =>
  data = await services.lc.fetchAll reqTool
  data

verEmail = (email) =>
  data = await services.lc.verEmail reqTool
  ,
    eamil: eamil
  data

resetPsdWithEmail = (email, password) =>
  data = await services.lc.resetPsdWithEmail reqTool
  ,
    eamil: eamil
    password: password
  data

resetPsd = (objectId, sessionToken, old_password, new_password) =>
  data = await services.lc.resetPsd reqTool
  ,
    objectId: objectId
    sessionToken: sessionToken
    old_password: old_password
    new_password: new_password
  data

update = (objectId, sessionToken, username, password, phoneNo) =>
  data = await services.lc.update reqTool
  ,
    objectId: objectId
    sessionToken: sessionToken
    username: username
    password: password
    phoneNo: phoneNo
  data

resetSessionToken = (objectId, sessionToken) =>
  data = await services.lc.resetSessionToken reqTool
  ,
    objectId: objectId
    sessionToken: sessionToken
  data

deleteUser = (objectId, sessionToken) =>
  data = await services.lc.delete reqTool
  ,
    objectId: objectId
    sessionToken: sessionToken
  data

deleteAll =  =>
  results = 
  ids = fetchAll().results.reduce (r, c) =>
    [
      r...
      c.objectId
    ]
  , []
  for id in ids
    data = await services.lc.delete reqTool
    ,
      objectId: id
      sessionToken: sessionToken
    data

export {
  signup
  login
  fetch
  fetchAll
  verEmail
  resetPsdWithEmail
  resetPsd
  update
  resetSessionToken
  deleteUser
}