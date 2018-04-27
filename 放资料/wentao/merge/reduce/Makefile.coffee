import 'shelljs/make'
import dd from 'ddeyes'
import * as store from '../../../../src/store'
import uuidTool from '../../../../src/utils/uuidTool'

{
  constants
  actions
  reducers
  getStore
} = store

myStore = getStore {
  appName: 'adminBe'
  reducers
  subscriber:
    sync: =>
      dd myStore.getState()
}

id1 = uuidTool()
id2 = uuidTool()

target.all = =>
  dd 'merge reduce test'

# 模拟登录用户测试
target.login = =>
  myStore.dispatch actions.loginSave
    login: {
      user:
        objectId: uuidTool()
        name: '文韬'
      token:
        '1111111'
    }

# 模拟自然人 CURD
target.user = =>
  # 增
  myStore.dispatch actions.userSave
    users: 
      objectId: id1
      name: '张三房东'
      phoneNo: '123456789'
  
  # 改
  myStore.dispatch actions.userPatch
    users:
      objectId: id1
      phoneNo: '987654321'
  
  # 覆盖
  myStore.dispatch actions.userSaveAll
    users:
      results: [
        {
          objectId: id1
          name: '张三'
          phoneNo: '123456789'
        }
        {
          objectId: id2
          name: '李四'
          phoneNo: '987654321'
        }
      ]
  
  # 删单个
  myStore.dispatch actions.userRemove
    users:
      objectId: id1
  
  # 删全部
  myStore.dispatch actions.userRemoveAll
    users: []

# 模拟房东 CURD
target.landlord = =>
  # 增
  myStore.dispatch actions.landlordSave
    landlord:
      objectId: id1
      landlordInfo: '房东信息'
  
  # 改
  myStore.dispatch actions.landlordPatch
    landlord:
      objectId: id1
      landlordInfo: '修改房东信息'
  
  # 覆盖
  myStore.dispatch actions.landlordSaveAll
    landlord:
      results: [
        {
          objectId: id1
          landlordInfo: '房东1'
        }
        {
          objectId: id2
          landlordInfo: '房东2'
        }
      ]
        
  # 删
  myStore.dispatch actions.landlordRemove
    landlord:
      objectId: id1

  # 删除全部
  myStore.dispatch actions.landlordRemoveAll
    landlord: []

# 模拟房客 CURD
target.tenant = =>
  # 增
  myStore.dispatch actions.tenantSave
    tenants:
      objectId: id2
      tenantInfo: '房客信息'
  
  # 改
  myStore.dispatch actions.tenantPatch
    targets:
      objectId: id2
      tenantInfo: '修改房客信息'
  
  # 覆盖
  myStore.dispatch actions.tenantSaveAll
    tenants:
      results: [
        {
          objectId: id1
          tenantInfo: '房客1'
        }
        {
          objectId: id2
          tenantInfo: '房客2'
        }
      ]
  
  # 删
  myStore.dispatch actions.tenantRemove
    tenants:
      objectId: id1
  
  # 删除全部
  myStore.dispatch actions.tenantRemoveAll
    tenants: []
  
# 模拟流水
target.todo = =>
  # 增
  myStore.dispatch actions.todoSave
    todo:
      objectId: id1
      todoInfo: '流水信息'
  
  # 改
  myStore.dispatch actions.todoPatch
    todo:
      objectId: id1
      todoInfo: '修改流水信息'
  
  # 覆盖
  myStore.dispatch actions.todoSaveAll
    todo:
      results: [
        {
          objectId: id1
          todoInfo: '流水信息1'
        }
        {
          objectId: id2
          todoInfo: '流水信息2'
        }
      ]
  
  # 删
  myStore.dispatch actions.todoRemove
    todo:
      objectId: id1
  
  # 删除全部
  myStore.dispatch actions.todoRemoveAll
    todo: []

# 模拟通知
target.notice = =>
  # 增
  myStore.dispatch actions.noticeSave
    notice:
      objectId: id1
      noticeInfo: '通知信息'
  
  # 改
  myStore.dispatch actions.noticePatch
    notice:
      objectId: id1
      noticeInfo: '修改通知信息'
  
  # 覆盖
  myStore.dispatch actions.noticeSaveAll
    notice:
      results: [
        {
          objectId: id1
          noticeInfo: '通知信息1'
        }
        {
          objectId: id2
          noticeInfo: '通知信息2'
        }
      ]
  
  # 删
  myStore.dispatch actions.noticeRemove
    notice:
      objectId: id1
  
  # 删除全部
  myStore.dispatch actions.noticeRemoveAll
    notice: []

# 模拟全部
target.merge = =>
  # 登录
  myStore.dispatch actions.loginSave
    login: {
      user:
        objectId: uuidTool()
        name: '文韬'
      token:
        '1111111'
    }
  
  # 创建自然人
  myStore.dispatch actions.userSaveAll
    users:
      results: [
        {
          objectId: id1
          name: '张三'
          phoneNo: '123456789'
        }
        {
          objectId: id2
          name: '李四'
          phoneNo: '987654321'
        }
      ]
  
  # 创建房东
  myStore.dispatch actions.landlordSave
    landlord:
      objectId: id1
      landlordInfo: '张三房东私人信息'
  
  # 创建房客
  myStore.dispatch actions.tenantSave
    tenants:
      objectId: id2
      tenantInfo: '李四房客私人信息'

  # 修改房东信息
  myStore.dispatch actions.landlordPatch
    landlord:
      objectId: id1
      landlordInfo: '修改张三房东私人信息'
  
  # 修改房客信息
  myStore.dispatch actions.tenantPatch
    tenants:
      objectId: id2
      tenantInfo: '修改李四房客私人信息'