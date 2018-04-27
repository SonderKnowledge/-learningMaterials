import 'shelljs/make'
import dd from 'ddeyes'
import fs from 'fs'
import path from 'path'
import landlord from '../sources/landlord'
import house from '../sources/house'

target.all = =>
  dd 'hello'

target.landlord = =>
  dd landlord

target.house = =>
  dd house

target.tenant = =>
  dd 'hello, tenant'

target.fs = =>
  # 应该要对 house 进行处理 根据里面的 landlord 的IDCard 和 realName 判断数据库是否
  # 存在该人如果没有则通过 landlord 新建 如果有则替换 landlordId 
  
  dd house
  # file = path.join __dirname, '../sources/house.coffee'
  # newFile = fs.readFileSync file, 'utf-8'
  # fs.writeFileSync './message.txt', newFile