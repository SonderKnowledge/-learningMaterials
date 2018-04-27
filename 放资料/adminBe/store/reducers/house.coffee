import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import houseReducers from '../../models/house/reducers'
import initializations from '../initializations'

export default handleActions

  HOUSE_SAVE: houseReducers.save
  HOUSE_SAVE_ALL: houseReducers.saveAll
  HOUSE_REMOVE: houseReducers.remove
  HOUSE_REMOVE_ALL: houseReducers.removeAll
  HOUSE_PATCH: houseReducers.patch

, initializations.house
