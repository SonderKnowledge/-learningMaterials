import dd from 'ddeyes'
import { request } from 'cfx.service'

createTodo = (data) =>
  result = await request "http://localhost:7001/todo"
  ,
    method: 'POST'
    data: data

fetchTodo = (data) =>
  result = await request "http://localhost:7001/todo/#{data.objectId}"
  ,
    method: 'GET'
    data: data

fetchAllTodo = () =>
  result = await request "http://localhost:7001/todo"
  ,
    method: 'GET'

updateTodo = (data) =>
  result = await request "http://localhost:7001/todo/#{data.objectId}"
  ,
    method: 'PUT'
    data: data

deleteTodo = (data) =>
  result = await request "http://localhost:7001/todo/#{data.objectId}"
  ,
    method: 'DELETE'
    data: data

export {
  createTodo
  fetchTodo
  updateTodo
  deleteTodo
  fetchAllTodo 
}