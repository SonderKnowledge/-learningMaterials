import 'shelljs/make'
import dd from 'ddeyes'
import objectFuc from '../Object'

target.all = ->
  dd 'hello world'

target.objectFuc = ->
  objectFuc()
  