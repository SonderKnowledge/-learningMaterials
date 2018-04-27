import 'shelljs/make'
import dd from 'ddeyes'
import {
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
} from './tasks'

target.all = =>
  dd 'hello, world!!'

target.signup = =>
  signup(
    'username'
    '123456'
    '12345678'
    '429343576@qq.com'
  )
  .then (result) =>
    dd result

target.login = =>
  login(
    'username'
    '123456'
  )
  .then (result) =>
    dd result

target.fetch = =>
  fetchAll()
    .then (results) =>
      fetch results.results[0].objectId
        .then (result) =>
          dd result

target.fetchAll = =>
  fetchAll()
    .then (results) =>
      dd results

# no email is not defined
target.verEmail = =>
  login 'username', '123456'
    .then (result) =>    
      verEmail result.email
        .then (data) =>
          dd data

# no email is not defined
target.resetPsdWithEmail = =>
  resetPsdWithEmail '429343576@qq.com', '123456'
    .then (result) =>
      dd result

target.resetPsd = =>
  login 'username', '123456'
    .then (result) =>
      resetPsd result.objectId, result.sessionToken, '123456', '123456'
        .then (data) =>
          dd data

target.update = =>
  login 'username', '123456'
    .then (result) =>
      update result.objectId, result.sessionToken, 'username', '123456' 
        .then (data) =>
          dd data

target.resetSessionToken = =>
  login 'username', '123456'
    .then (result) =>
      resetSessionToken result.objectId, result.sessionToken
        .then (data) =>
          dd data

# warning 不要轻易使用
target.deleteUser = =>
  login 'username', '123456'
    .then (result) =>
      deleteUser result.objectId, result.sessionToken
        .then (data) =>
          dd data
