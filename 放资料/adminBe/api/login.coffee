import { request } from 'cfx.service'
import services from '../../src/config/config.default'

register = ({ username, password }) =>
  result = await request "http://localhost:7001/signup"
  ,
    method: 'POST'
    data:
      username: username
      password: password

login = services.Login.login({ username, password })
# login = ({ username, password }) =>
#   result = await request "http://localhost:7001/login"
#   ,
#     method: 'POST'
#     data:
#       username: username
#       password: password

export {
  login
  register
}
