import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import roomSagas from './room'

{ 
  ROOM_FETCH
  ROOM_CREATE
  ROOM_UPDATE
  ROOM_DELETE
  ROOM_RELOAD
} = constants.types

{
  put
  takeLatest
} = sagaEffects

room =
  fetch: (action) =>
    roomSagas.fetch action
    , {
      put
    }
  create: (action) =>
    roomSagas.create action
    , {
      put
    }
  update: (action) =>
    roomSagas.update action
    , {
      put
    }
  delete: (action) =>
    roomSagas.delete action
    , {
      put
    }
  reload: (action) =>
    roomSagas.reload action
    , {
      put
    }

  delete: (action) ->
    TENANTSAGAS.delete action
    , {
      put
    }

export default [
  ->
    yield takeLatest ROOM_FETCH, room.fetch
  ->
    yield takeLatest ROOM_CREATE, room.create
  ->
    yield takeLatest ROOM_UPDATE, room.update
  ->
    yield takeLatest ROOM_DELETE, room.delete
  ->
    yield takeLatest ROOM_RELOAD, room.reload
]