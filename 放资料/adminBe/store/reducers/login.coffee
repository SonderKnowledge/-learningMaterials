import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import loginReducers from '../../models/login/reducers'
import initializations from '../initializations'

export default handleActions

  LOGIN_SAVE: loginReducers.save
  LOGIN_SIGNOUT: loginReducers.signout

, initializations.login