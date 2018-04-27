import dd from 'ddeyes'
import { request } from 'cfx.service'

createUser = (data) =>
  result = await request 'http://localhost:7001/user'
  ,
    method: 'POST'
    data: data

fetchUser = (data) =>
  result = await request "http://localhost:7001/user/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllUser = () =>
  result = await request "http://localhost:7001/user"
  ,
    method: 'GET'

updateUser = (data) =>
  result = await request "http://localhost:7001/user/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteUser = (data) =>
  result = await request "http://localhost:7001/user/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

export {
  createUser
  fetchUser
  updateUser
  deleteUser
  fetchAllUser
}