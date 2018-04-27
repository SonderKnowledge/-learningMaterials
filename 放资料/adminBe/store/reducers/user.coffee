import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import userReducers from '../../models/users/reducers'
import initializations from '../initializations'

export default handleActions

  USER_SAVE: userReducers.save
  USER_PATCH: userReducers.patch
  USER_REMOVE: userReducers.remove
  USER_SAVE_ALL: userReducers.saveAll
  USER_REMOVE_ALL: userReducers.removeAll

, initializations.user
