import dd from 'ddeyes'
import { request } from 'cfx.service'

createNotice = (data) =>
  result = await request "http://localhost:7001/notice"
  ,
    method: 'POST'
    data: data

fetchNotice = (data) =>
  result = await request "http://localhost:7001/notice/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllNotice = () =>
  result = await request "http://localhost:7001/notice"
  ,
    method: 'GET'

updateNotice = (data) =>
  result = await request "http://localhost:7001/notice/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteNotice = (data) =>
  result = await request "http://localhost:7001/notice/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

export {
  createNotice
  fetchNotice
  updateNotice
  deleteNotice
  fetchAllNotice  
}