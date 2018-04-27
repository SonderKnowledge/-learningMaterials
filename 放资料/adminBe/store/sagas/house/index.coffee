import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import houseSagas from './house'

{
  HOUSE_FETCH
  HOUSE_CREATE
  HOUSE_UPDATE
  HOUSE_DELETE
  HOUSE_RELOAD
} = constants.types

{
  put
  takeLatest
} = sagaEffects

house =
  fetch: (action) =>
    houseSagas.fetch action
    , {
      put
    }
  create: (action) =>
    houseSagas.create action
    , {
      put
    }
  update: (action) =>
    houseSagas.update action
    , {
      put
    }
  delete: (action) =>
    houseSagas.delete action
    , {
      put
    }
  reload: (action) =>
    houseSagas.reload action
    , {
      put
    }

export default [
  ->
    yield takeLatest HOUSE_FETCH, house.fetch
  ->
    yield takeLatest HOUSE_CREATE, house.create
  ->
    yield takeLatest HOUSE_UPDATE, house.update
  ->
    yield takeLatest HOUSE_DELETE, house.delete
  ->
    yield takeLatest HOUSE_RELOAD, house.reload
]