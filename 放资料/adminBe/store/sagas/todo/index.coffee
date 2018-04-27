import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import getTodoSagas from './todo'
import getService from '../../../../src/services'
import request from '../../../../src/services/request'

{
  TODO_CREATE
  TODO_FETCH
  TODO_RELOAD
  TODO_UPDATE
  TODO_DELETE
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

  TODOSAGAS = getTodoSagas
    service: Service

  todos =
    create: (action) ->
      TODOSAGAS.create action
      , {
        put
      }

    fetch: (action) ->
      TODOSAGAS.fetch action
      , {
        put
      }

    reload: (action) ->
      TODOSAGAS.reload action
      , {
        put
      }

    update: (action) ->
      TODOSAGAS.update action
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
      yield takeLatest TODO_CREATE
      , todos.create
    ->
      yield takeLatest TODO_FETCH
      , todos.fetch
    ->
      yield takeLatest TODO_UPDATE
      , todos.update
    ->
      yield takeLatest TODO_RELOAD
      , todos.reload
    ->
      yield takeLatest TODO_DELETE
      , todos.delete
  ]