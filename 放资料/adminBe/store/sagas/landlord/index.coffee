import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import getLandlordSagas from './landlord'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  LANDLORD_CREATE
  LANDLORD_FETCH
  LANDLORD_RELOAD
  LANDLORD_UPDATE
  LANDLORD_DELETE
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

  LANDLORDSAGAS = getLandlordSagas
    service: Service

  landlords =
    create: (action) ->
      LANDLORDSAGAS.create action
      , {
        put
      }

    fetch: (action) ->
      LANDLORDSAGAS.fetch action
      , {
        put
      }

    reload: (action) ->
      LANDLORDSAGAS.reload action
      , {
        put
      }

    update: (action) ->
      LANDLORDSAGAS.update action
      , {
        put
      }

    delete: (action) ->
      LANDLORDSAGAS.delete action
      , {
        put
      }

  [
    ->
      yield takeLatest LANDLORD_CREATE
      , landlords.create
    ->
      yield takeLatest LANDLORD_UPDATE
      , landlords.update
    ->
      yield takeLatest LANDLORD_DELETE
      , landlords.delete
    ->
      yield takeLatest LANDLORD_RELOAD
      , landlords.reload
  ]