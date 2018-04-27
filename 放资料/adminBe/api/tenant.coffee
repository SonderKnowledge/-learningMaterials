import dd from 'ddeyes'
import { request } from 'cfx.service'

createTenant = (data) =>
  result = await request "http://localhost:7001/tenant"
  ,
    method: 'POST'
    data: data

fetchTenant = (data) =>
  result = await request "http://localhost:7001/tenant/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllTenant = () =>
  result = await request "http://localhost:7001/tenant"
  ,
    method: 'GET'

updateTenant = (data) =>
  result = await request "http://localhost:7001/tenant/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteTenant = (data) =>
  result = await request "http://localhost:7001/tenant/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

export {
  createTenant
  fetchTenant
  updateTenant
  deleteTenant
  fetchAllTenant 
}