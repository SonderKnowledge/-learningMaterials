import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import landlordReducers from '../../models/landlords/reducers'
import initializations from '../initializations'

export default handleActions

  LANDLORD_SAVE: landlordReducers.save
  LANDLORD_PATCH: landlordReducers.patch
  LANDLORD_REMOVE: landlordReducers.remove
  LANDLORD_SAVE_ALL: landlordReducers.saveAll  
  LANDLORD_REMOVE_ALL: landlordReducers.removeAll

, initializations.landlord
