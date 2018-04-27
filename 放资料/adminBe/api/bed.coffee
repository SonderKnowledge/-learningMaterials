import { request } from 'cfx.service'

createBed = (data) =>
  result = await request "http://localhost:7001/bed"
  ,
    method: 'POST'
    data: data

fetchBed = (data) =>
  result = await request "http://localhost:7001/bed/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllBed = () =>
  result = await request "http://localhost:7001/bed"
  ,
    method: 'GET'

updateBed = (data) =>
  result = await request "http://localhost:7001/bed/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteBed = (data) =>
  result = await request "http://localhost:7001/bed/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

findBedWithRoom = (data) =>
  result = await request "http://localhost:7001/bed/link/#{data.roomId}"
  ,
    method: 'GET'
    data: data

export {
  createBed
  fetchBed
  updateBed
  deleteBed
  fetchAllBed
  findBedWithRoom
}