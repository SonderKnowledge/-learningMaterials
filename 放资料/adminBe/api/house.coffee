import dd from 'ddeyes'
import { request } from 'cfx.service'

createHouse = (data) =>
  result = await request "http://localhost:7001/house"
  ,
    method: 'POST'
    data: data

fetchHouse = (data) =>
  result = await request "http://localhost:7001/house/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllHouse = () =>
  result = await request "http://localhost:7001/house"
  ,
    method: 'GET'

updateHouse = (data) =>
  result = await request "http://localhost:7001/house/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteHouse = (data) =>
  result = await request "http://localhost:7001/house/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

findHouseWithLandlord = (data) =>
  result = await request "http://localhost:7001/house/link/#{data.objectId}"
  ,
    method: 'GET'
    data: data

export {
  createHouse
  fetchHouse
  updateHouse
  deleteHouse
  fetchAllHouse  
  findHouseWithLandlord
}