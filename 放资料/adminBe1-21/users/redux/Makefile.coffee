import dd from 'ddeyes'
import 'shelljs/make'
import { staticFuc, userSave, userPatch, userSaveAll,userRemove } from './reduce'
import {
  userSignup
  userLogin
  userFetch
  userReload
  userVerEmail
  userResetPsdWithEmail
  userResetPsd
  userUpdate
  userResetSessionToken
  userDelete
} from './sagas'

target.all = =>
  dd 'Hello adminBe!'

target.static = =>
  staticFuc()

target.reducers = =>
  userSave '张三', '123456'
  userSave '王五', '123456'
  # userPatch '李四', '123456'
  # userSaveAll()
  # userRemove()

target.sagas = =>
  await userSignup('王五', '123456')
  # await userReload()
  # await userResetPsd '123456', '123456'
  # await userUpdate '用户二', '123456'