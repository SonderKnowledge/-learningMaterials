import dd from 'ddeyes'

export default
  save: (
    state
    {
      payload:
        todo: todo
    }
  ) =>
    [
      state...
      todo
    ]
  
  patch: (
    state
    {
      payload:
        todo: todo
    }
  ) =>
    temp = []
    state.reduce (result, current, _index, array) =>
      if current.objectId is todo.objectId
        temp = JSON.parse JSON.stringify array
        temp[_index].todoInfo = todo.todoInfo
    , []
    temp
  
  remove: (
    state
    {
      payload:
        todo: todo
    }
  ) =>
    temp = []
    state.reduce (result, current, _index, array) =>
      if current.objectId is todo.objectId
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
    , []
    temp

  saveAll: (
    state
    {
      payload:
        todo: todo
    }
  ) =>
    [
      todo.results...
    ]
  
  