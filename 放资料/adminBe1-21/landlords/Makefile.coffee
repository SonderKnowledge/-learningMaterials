import dd from 'ddeyes'
import 'shelljs/make'
import { createLandlord } from './sagas'

target.all = =>
  dd 'Hello adminBe!'

target.static = =>
  staticFuc()

target.sagas = =>
  await createLandlord '张三', '123456', '房东私人信息'