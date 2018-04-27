import { sagaEffects } from 'cfx.redux-saga'
import constants from '../../constants'
import rentSagas from './rent'

{
  RENT_FETCH
  RENT_CREATE
  RENT_UPDATE
  RENT_DELETE
  RENT_RELOAD
} = constants.types

{
  put
  takeLatest
} = sagaEffects

rent =
  fetch: (action) =>
    rentSagas.fetch action
    , {
      put
    }
  create: (action) =>
    rentSagas.create action
    , {
      put
    }
  update: (action) =>
    rentSagas.update action
    , {
      put
    }
  delete: (action) =>
    rentSagas.delete action
    , {
      put
    }
  reload: (action) =>
    rentSagas.reload action
    , {
      put
    }

export default [
  ->
    yield takeLatest RENT_FETCH, rent.fetch
  ->
    yield takeLatest RENT_CREATE, rent.create
  ->
    yield takeLatest RENT_UPDATE, rent.update
  ->
    yield takeLatest RENT_DELETE, rent.delete
  ->
    yield takeLatest RENT_RELOAD, rent.reload
]