import dd from 'ddeyes'
import { request } from 'cfx.service'

createRoom = (data) =>
  result = await request "http://localhost:7001/room"
  ,
    method: 'POST'
    data: data

fetchRoom = (data) =>
  result = await request "http://localhost:7001/room/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllRoom = () =>
  result = await request "http://localhost:7001/room"
  ,
    method: 'GET'

updateRoom = (data) =>
  result = await request "http://localhost:7001/room/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteRoom = (data) =>
  result = await request "http://localhost:7001/room/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

findRoomWithHouse = (data) =>
  result = await request "http://localhost:7001/room/link/#{data.houseId}"
  ,
    method: 'GET'
    data: data

export {
  createRoom
  fetchRoom
  updateRoom
  deleteRoom
  fetchAllRoom 
  findRoomWithHouse
}