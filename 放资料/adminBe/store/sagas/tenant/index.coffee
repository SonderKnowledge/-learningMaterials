import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import getTenantSagas from './tenant'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  TENANT_CREATE
  TENANT_FETCH
  TENANT_RELOAD
  TENANT_UPDATE
  TENANT_DELETE
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

  TENANTSAGAS = getTenantSagas
    service: Service

  tenants =
    create: (action) ->
      TENANTSAGAS.create action
      , {
        put
      }

    fetch: (action) ->
      TENANTSAGAS.fetch action
      , {
        put
      }

    reload: (action) ->
      TENANTSAGAS.reload action
      , {
        put
      }

    update: (action) ->
      TENANTSAGAS.update action
      , {
        put
      }

    delete: (action) ->
      TENANTSAGAS.delete action
      , {
        put
      }

  [
    ->
      yield takeLatest TENANT_CREATE
      , tenants.create
    ->
      yield takeLatest TENANT_UPDATE
      , tenants.update
    ->
      yield takeLatest TENANT_DELETE
      , tenants.delete
    ->
      yield takeLatest TENANT_RELOAD
      , tenants.reload
  ]