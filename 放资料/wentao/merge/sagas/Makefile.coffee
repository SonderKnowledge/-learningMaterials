import 'shelljs/make'
import dd from 'ddeyes'
import isEqual from 'is-equal'
import * as store from '../../../../src/store'
import {
  promiseWrapper
  interfaceConfig
} from '../../../../src/utils/promiseWrapper'

import {
  loginSignup
  loginLogin
} from '../../../../src/interface/login'

import {
  userCreate
  userFetch
  userReload
  userVerEmail
  userResetPsd
  userUpdate
  userDelete
  userResetSessionToken
  userResetPsdWithEmail
} from '../../../../src/interface/users'

import {
  createLandlord
  updateLandlord
  deleteLandlord
  reloadLandlord
} from '../../../../src/interface/landlord'

import {
  createTenant
  updateTenant
  deleteTenant
  reloadTenant
} from '../../../../src/interface/tenant'

import {
  createTodo
  updateTodo
  fetchTodo
  deleteTodo
  reloadTodo
} from '../../../../src/interface/todo'

import {
  createNotice
  updateNotice
  deleteNotice
  reloadNotice
} from '../../../../src/interface/notice'

{
  constants
  actions
  sagas
  reducers
  getStore
} = store

subscriber = (
  prevState
  nextState
  action
  dispatch
) =>
  dd myStore.getState() if not isEqual prevState, nextState

myStore = getStore {
  appName: 'adminBe'
  sagas # sagas(urlConf)
  reducers
  subscriber:
    async: subscriber
}

target.all = =>
  dd 'merge sagas test'
  dd Array.isArray sagas

target.sagas = =>
  
  APP = getApp {
    appName: 'adminBe'
    store:
      actions: actions
      reducers: reducers
      sagas: sagas
    urlConf:
      host: 'http://192.168.0.192'
      port: '7001'
      prefix: ''
    interfaces: [
      loginLogin
      userCreate
      userUpdate
      userFetch
      userDelete
      userReload
      createLandlord
      updateLandlord
      deleteLandlord
      reloadLandlord
      createTenant
      updateTenant
      deleteTenant
      reloadTenant
      createTodo
      updateTodo
      fetchTodo
      deleteTodo
      reloadTodo
      createNotice
      updateNotice
      deleteNotice
      reloadNotice
    ]
  }

  {
    store
    interfaces
  } = APP

  # funcList = interfaceConfig {
  #   loginLogin
  #   userCreate
  #   userUpdate
  #   userFetch
  #   userDelete
  #   userReload
  #   createLandlord
  #   updateLandlord
  #   deleteLandlord
  #   reloadLandlord
  #   createTenant
  #   updateTenant
  #   deleteTenant
  #   reloadTenant
  #   createTodo
  #   updateTodo
  #   fetchTodo
  #   deleteTodo
  #   reloadTodo
  #   createNotice
  #   updateNotice
  #   deleteNotice
  #   reloadNotice
  # }, {
  #   store: myStore
  #   actions
  # }

  # # 特定用户登录
  # await funcList.loginLogin
  #   username: '陈欢'
  #   password: '123456'

  # # 创建自然人
  # userData = await funcList.userCreate
  #   realName: '张三'
  #   sex: '男'
  #   phoneNo: '18671952622'
  #   IDCard: '420683199305012222'
  #   eamil: '110@qq.com'
  #   dateBirth: '19930501'

  # # 创建房东
  # landlordData = await funcList.createLandlord
  #   userId: userData.objectId
  #   landlordInfo: '房东特有信息'

  # # 更新房东的公共信息
  # await funcList.userUpdate
  #   objectId: userData.objectId
  #   phoneNo: '11111111'

  # # 更新房东的特有信息
  # await funcList.updateLandlord
  #   objectId: landlordData.objectId
  #   landlordInfo: '修改房东特有信息'

  # # 删除房东
  # await funcList.deleteLandlord
  #   userId: userData.objectId
  #   objectId: landlordData.objectId

  # # 返回所有房东
  # await funcList.reloadLandlord {}

  # # 创建房客
  # tenantData = await funcList.createTenant
  #   userId: userData.objectId
  #   tenantInfo: '房客特有信息'

  # # 更新房客的公共信息
  # await funcList.userUpdate
  #   objectId: userData.objectId
  #   phoneNo: '222222'

  # # 更新房客的特有信息
  # await funcList.updateTenant
  #   objectId: tenantData.objectId
  #   tenantInfo: '修改房客特有信息'

  # 删除房客
  # await funcList.deleteTenant
  #   userId: userData.objectId
  #   objectId: tenantData.objectId

  # # 返回所有房客
  # await funcList.reloadTenant {}

  # # 删除自然人
  # await funcList.userDelete
  #   objectId: userData.objectId

  # 返回所有自然人
  # await funcList.userReload {}

  # # 创建流水
  # todoData = await funcList.createTodo
  #   token: myStore.getState().adminBe.login.token
  #   startTime: '2018-01-23'
  #   endTime: '2018-01-29'
  #   todoInfo: '流水信息'

  # # 查找流水
  # await funcList.fetchTodo
  #   objectId: todoData.objectId

  # # 更新流水
  # await funcList.updateTodo
  #   objectId: todoData.objectId
  #   todoInfo: '更新流水'

  # # 返回所有流水
  # await funcList.reloadTodo
  #   token: myStore.getState().adminBe.login.token

  # # 删除流水
  # await funcList.deleteTodo
  #   token: myStore.getState().adminBe.login.token
  #   objectId: todoData.objectId

  # # 创建通知
  # noticeData = await funcList.createNotice
  #   token: myStore.getState().adminBe.login.token
  #   noticeInfo: '创建通知'

  # # 更新通知  好像并用不上
  # await funcList.updateNotice
  #   objectId: noticeData.objectId
  #   noticeInfo: '更新通知'

  # # 删除通知
  # await funcList.deleteNotice
  #   objectId: noticeData.objectId

  # # 通知列表
  # await funcList.reloadNotice {}