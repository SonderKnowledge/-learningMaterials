import dd from 'ddeyes'
import { createApp } from 'cfx.redux'
import {
  reducers as reducersObj
  sagas as sagasObj
} from './src/redux'

export default =>

  myApp = createApp
    redux:
      reducers: reducersObj
      sagas: sagasObj
    subscriber:
      sync: (store) =>
        dd store.getState()
      async: (
        prevState
        nextState
        action 
        dispatch
      ) =>
        dd async: {
          prevState
          nextState
          action
        }
  dd myApp.store.getState()

  # action = myApp._.actions.increment 5

  # dd await myApp.dispatch.increment 1
    
  # dd await myApp.dispatch.incrementAsync 1

  # dd await myApp.dispatch.adduser {
  #   objectId: 1
  #   name: 'zhangsan'
  #   age: 25
  #   phoneNo: '123456'
  # }

  # dd await myApp.dispatch.patchuser {
  #   objectId: 1
  #   age: 22
  # }

  # dd await myApp.dispatch.removeuser {}

  # data = await myApp.dispatch.adduserAsync {
  #   realName: '测试'
  #   phoneNo: '112233'
  #   address: '武汉'
  # }

  # dd await myApp.dispatch.login {
  #   user:
  #     realName: '张三'
  #     age: 24
  #   token: '123asd'
  # }