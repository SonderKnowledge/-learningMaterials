import { sagaEffects } from 'cfx.redux-saga'
import dd from 'ddeyes'
import constants from '../../constants'
import getLoginSagas from './login'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  LOGIN_LOGIN
  LOGIN_SIGNUP
} = constants.types

{
  put
  takeLatest
} = sagaEffects

export default ({
  urlConf
}) =>

  Service = getService { 
    urlConf
    request
  }

  LOGINSAGAS = getLoginSagas
    service: Service

  login =
    login: (action) =>
      LOGINSAGAS.login action
      , {
        put
      }

    signup: (action) =>
      LOGINSAGAS.signup action
      , {
        put
      }

  [
    ->
      yield takeLatest LOGIN_LOGIN
      , login.login
    ->
      yield takeLatest LOGIN_SIGNUP
      , login.signup
  ]