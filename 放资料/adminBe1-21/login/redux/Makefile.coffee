import dd from 'ddeyes'
import 'shelljs/make'
import { staticFuc, loginReduce, signout } from './reduce'
import { login } from './sagas'

target.all = =>
  dd 'Hello adminBe!'

target.static = =>
  staticFuc()

target.reducers = =>
  loginReduce '王五', '123456'
  signout()

target.sagas = =>
  await login '王五', '123456'
