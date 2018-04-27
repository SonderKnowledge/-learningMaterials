import dd from 'ddeyes'
import uuidTool from '../../utils/uuidTool'

export default
  save: (
    state
    {
      payload:
        users: users
    }
  ) =>
    [
      state...
      users
    ]
  
  patch: (
    state
    {
      payload:
        users: users
    }
  ) =>
    temp = []    
    state.reduce (result, current, _index, array) =>
      if current.objectId is users.objectId
        temp = JSON.parse JSON.stringify array
        temp[_index].phoneNo = users.phoneNo
    , []
    temp

  saveAll: (
    state
    {
      payload:
        users: users
    }
  ) =>
    [
      users.results...
    ]

  remove: (
    state
    {
      payload:
        users: users
    }
  ) =>
    temp = []          
    state.reduce (result, current, _index, array) =>                 
      if current.objectId is users.objectId
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
      temp
    , state
  
  removeAll: (
    state
    {
      payload:
        users: users
    }
  ) =>
    []
