import dd from 'ddeyes'
import { promiseWrapper } from '../utils/promiseWrapper'

# 生成通知
createNotice = (
  {
    token
    noticeInfo
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.noticeCreate
    actionParams: {
      token
      noticeInfo
    }
  }

# 更新通知
updateNotice = (
  {
    objectId
    noticeInfo    
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.noticeUpdate
    actionParams: {
      objectId
      noticeInfo
    }
  }

# 删除通知
deleteNotice = (
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
    action: actions.noticeDelete
    actionParams: {
      objectId
    }
  }

# 通知列表
reloadNotice = (
  {
    userId
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.noticeReload
    actionParams: {
      userId
    }
  }

export {
  createNotice
  updateNotice
  deleteNotice
  reloadNotice
}