import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import rentReducers from '../../models/rent/reducers'
import initializations from '../initializations'

export default handleActions

  RENT_SAVE: rentReducers.save
  RENT_SAVE_ALL: rentReducers.saveAll
  RENT_REMOVE: rentReducers.remove
  RENT_REMOVE_ALL: rentReducers.removeAll
  RENT_PATCH: rentReducers.patch

, initializations.rent
