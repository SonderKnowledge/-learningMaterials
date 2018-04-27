import dd from 'ddeyes'
import { promiseWrapper } from '../utils/promiseWrapper'

# 创建房客
createTenant = (
  {
    userId
    tenantInfo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.tenantCreate
    actionParams: {
      userId
      tenantInfo
    }
  }

# 更新房客信息
updateTenant = (
  {
    objectId
    tenantInfo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.tenantUpdate
    actionParams: {
      objectId
      tenantInfo
    }
  }

# 删除房客
deleteTenant = (
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
    action: actions.tenantDelete
    actionParams: {
      userId
      objectId
    }
  }

# 返回所有房客
reloadTenant = (
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.tenantReload
  }

export {
  createTenant
  updateTenant
  deleteTenant
  reloadTenant
}