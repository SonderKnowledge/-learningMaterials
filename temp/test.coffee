fs = require 'fs'
adminBe = require 'adminBe'
createApp = require('cfx.redux').createApp
reducers = require('adminBe').store.reducers
sagas = require('adminBe').store.sagas

# store test
myApp = createApp
  reducers: reducers
  sagas: sagas
  onSubscribe: (store) =>
    console.log 'STORE getState--->>>', store.getState()

# 注册
myApp
  .dispatch
  .registerAsync {
    username: '张三'
    password: '123456'
  }
  .then (result) =>
    console.log 'STORE result--->>>', result

# 登录
myApp
  .dispatch
  .loginAsync {
    username: '张三'
    password: '123456'
  }
  .then (result) =>
    console.log '测试登录接口--->>>', result

    
configJson = JSON.parse fs.readFileSync('config.json', 'utf8')
console.log '请看json-->>', configJson