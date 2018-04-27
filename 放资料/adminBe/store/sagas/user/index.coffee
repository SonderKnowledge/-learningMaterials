import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import getUserSagas from './user'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  USER_SAVE
  USER_CREATE
  USER_FETCH
  USER_RELOAD
  USER_UPDATE
  USER_DELETE
  USER_RESET_PSD
  USER_VER_EMAIL
  USER_REFRESH_TOKEN
  USER_RESET_SESSIONTOKEN
  USER_RESET_PSD_WITH_EMAIL
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

  USERSAGAS = getUserSagas
    service: Service

  users =
    create: (action) ->
      USERSAGAS.create action
      , {
        put
      }

    fetch: (action) ->
      USERSAGAS.fetch action
      , {
        put
      }

    reload: (action) ->
      USERSAGAS.reload action
      , {
        put
      }

    verUserEmail: (action) ->
      USERSAGAS.verUserEmail action
      , {
        put
      }

    resetUserPsd: (action) ->
      USERSAGAS.resetUserPsd action
      , {
        put
      }

    update: (action) ->
      USERSAGAS.update action
      , {
        put
      }

    delete: (action) ->
      USERSAGAS.delete action
      , {
        put
      }

    refreshToken: (action) ->
      USERSAGAS.refreshToken action
      , {
        put
      }

    resetUserSessionToken: (action) ->
      USERSAGAS.resetUserSessionToken action
      , {
        put
      }

    resetUserPsdWithEmail: (action) ->
      USERSAGAS.resetUserPsdWithEmail action
      , {
        put
      }

  [
    ->
      yield takeLatest USER_CREATE
      , users.create
    ->
      yield takeLatest USER_FETCH
      , users.fetch
    ->
      yield takeLatest USER_RELOAD
      , users.reload
    ->
      yield takeLatest USER_UPDATE
      , users.update
    ->
      yield takeLatest USER_DELETE
      , users.delete
    ->
      yield takeLatest USER_VER_EMAIL
      , users.verUserEmail
    ->
      yield takeLatest USER_RESET_PSD
      , users.resetUserPsd
    ->
      yield takeLatest USER_REFRESH_TOKEN
      , users.refreshToken
    ->
      yield takeLatest USER_RESET_SESSIONTOKEN
      , users.resetUserSessionToken
    ->
      yield takeLatest USER_RESET_PSD_WITH_EMAIL
      , users.resetUserPsdWithEmail
  ]