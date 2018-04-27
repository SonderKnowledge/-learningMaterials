import dd from 'ddeyes'
import uuidTool from '../../utils/uuidTool'

export default
  save: (
    state
    {
      payload:
        landlords: landlords
    }
  ) =>
    [
      state...
      landlords
    ]
  
  patch: (
    state
    {
      payload:
        landlords: landlords
    }
  ) =>
    temp = []    
    state.reduce (result, current, _index, array) =>
      if current.objectId is landlords.objectId
        temp = JSON.parse JSON.stringify array
        temp[_index].landlordInfo = landlords.landlordInfo
    , []
    temp
  
  remove: (
    state
    {
      payload:
        landlords: landlords
    }
  ) =>
    temp = []    
    state.reduce (result, current, _index, array) =>
      if current.objectId is landlords.objectId
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
    , []
    temp
  
  saveAll: (
    state
    {
      payload:
        landlords: landlords
    }
  ) =>
    [
      landlords.results...
    ]
