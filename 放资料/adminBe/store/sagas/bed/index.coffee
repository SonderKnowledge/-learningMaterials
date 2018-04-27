import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import getBedSagas from './bed'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  BED_FETCH
  BED_CREATE
  BED_UPDATE
  BED_DELETE
  BED_RELOAD
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

  bedSagas = getBedSagas
    service: Service
    
  bed =
    fetch: (action) =>
      bedSagas.fetch action
      , {
        put
      }
    create: (action) =>
      bedSagas.create action
      , {
        put
      }
    update: (action) =>
      bedSagas.update action
      , {
        put
      }
    delete: (action) =>
      bedSagas.delete action
      , {
        put
      }
    reload: (action) =>
      bedSagas.reload action
      , {
        put
      }

    delete: (action) ->
      TODOSAGAS.delete action
      , {
        put
      }

  [
    ->
      yield takeLatest BED_FETCH, bed.fetch
    ->
      yield takeLatest BED_CREATE, bed.create
    ->
      yield takeLatest BED_UPDATE, bed.update
    ->
      yield takeLatest BED_DELETE, bed.delete
    ->
      yield takeLatest BED_RELOAD, bed.reload
  ]
