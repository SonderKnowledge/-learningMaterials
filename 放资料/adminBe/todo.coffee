import dd from 'ddeyes'
import { promiseWrapper } from '../utils/promiseWrapper'

# 创建流水
createTodo = (
  {
    token
    startTime
    endTime
    todoInfo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.todoCreate
    actionParams: {
      token
      startTime
      endTime
      todoInfo
    }
  }

# 更新流水
updateTodo = (
  {
    objectId
    todoInfo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.todoUpdate
    actionParams: {
      objectId
      todoInfo
    }
  }

# 查找流水
fetchTodo = (
  {
    objectId
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.todoFetch
    actionParams: {
      objectId
    }
  }

# 删除流水
deleteTodo = (
  {
    token
    objectId
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.todoDelete
    actionParams: {
      token
      objectId
    }
  }

# 返回流水表
reloadTodo = (
  {
    token
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.todoReload
    actionParams: {
      token
    }
  }

export {
  createTodo
  updateTodo
  fetchTodo
  deleteTodo
  reloadTodo
}