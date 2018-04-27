import dd from 'ddeyes'
import uuidTool from '../../utils/uuidTool'

export default
  save: (
    state
    {
      payload:
        notice: notice
    }
  ) =>
    [
      state...
      notice
    ]
  
  patch: (
    state
    {
      payload:
        notice: notice
    }
  ) =>
    temp = []    
    state.reduce (result, current, _index, array) =>
      if current.objectId is notice.objectId
        temp = JSON.parse JSON.stringify array
        temp[_index].noticeInfo = notice.noticeInfo
    , []
    temp
  
  remove: (
    state
    {
      payload:
        notice: notice
    }
  ) =>
    temp = []    
    state.reduce (result, current, _index, array) =>
      if current.objectId is notice.objectId
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
    , []
    temp
  
  saveAll: (
    state
    {
      payload:
        notice: notice
    }
  ) =>
    [
      notice.results...
    ]
