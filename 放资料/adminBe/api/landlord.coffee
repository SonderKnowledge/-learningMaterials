import dd from 'ddeyes'
import { request } from 'cfx.service'

createLandlord = (data) =>
  result = await request "http://localhost:7001/landlord"
  ,
    method: 'POST'
    data: data

fetchLandlord = (data) =>
  result = await request "http://localhost:7001/landlord/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllLandlord = () =>
  result = await request "http://localhost:7001/landlord"
  ,
    method: 'GET'

updateLandlord = (data) =>
  result = await request "http://localhost:7001/landlord/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteLandlord = (data) =>
  result = await request "http://localhost:7001/landlord/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

export {
  createLandlord
  fetchLandlord
  updateLandlord
  deleteLandlord
  fetchAllLandlord  
}