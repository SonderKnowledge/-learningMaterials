import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import getNoticeSagas from './notice'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  NOTICE_CREATE
  NOTICE_FETCH
  NOTICE_RELOAD
  NOTICE_UPDATE
  NOTICE_DELETE
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

  NOTICESAGAS = getNoticeSagas
    service: Service
  notices =
    create: (action) ->
      NOTICESAGAS.create action
      , {
        put
      }

    fetch: (action) ->
      NOTICESAGAS.fetch action
      , {
        put
      }

    reload: (action) ->
      NOTICESAGAS.reload action
      , {
        put
      }

    update: (action) ->
      NOTICESAGAS.update action
      , {
        put
      }

    delete: (action) ->
      NOTICESAGAS.delete action
      , {
        put
      }

  [
    ->
      yield takeLatest NOTICE_CREATE
      , notices.create
    ->
      yield takeLatest NOTICE_UPDATE
      , notices.update
    ->
      yield takeLatest NOTICE_DELETE
      , notices.delete
    ->
      yield takeLatest NOTICE_RELOAD
      , notices.reload
  ]