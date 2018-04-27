import dd from 'ddeyes'
import { promiseWrapper } from '../utils/promiseWrapper'

# 创建房东
createLandlord = (
  {
    userId
    landlordInfo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.landlordCreate
    actionParams: {
      userId
      landlordInfo
    }
  }

# 更新房东信息
updateLandlord = (
  {
    objectId
    landlordInfo    
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.landlordUpdate
    actionParams: {
      objectId
      landlordInfo
    }
  }

# 删除房东
deleteLandlord = (
  {
    userId
    objectId   
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.landlordDelete
    actionParams: {
      userId
      objectId
    }
  }

# 返回所有房东
reloadLandlord = (
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.landlordReload
  }

export {
  createLandlord
  updateLandlord
  deleteLandlord
  reloadLandlord
}