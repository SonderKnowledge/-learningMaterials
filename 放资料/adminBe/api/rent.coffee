import dd from 'ddeyes'
import { request } from 'cfx.service'

createRent = (data) =>
  result = await request "http://localhost:7001/rent"
  ,
    method: 'POST'
    data: data

fetchRent = (data) =>
  result = await request "http://localhost:7001/rent/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllRent = () =>
  result = await request "http://localhost:7001/rent"
  ,
    method: 'GET'

updateRent = (data) =>
  result = await request "http://localhost:7001/rent/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteRent = (data) =>
  result = await request "http://localhost:7001/rent/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

export {
  createRent
  fetchRent
  updateRent
  deleteRent
  fetchAllRent  
}