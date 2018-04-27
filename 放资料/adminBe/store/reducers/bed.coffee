import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import bedReducers from '../../models/bed/reducers'
import initializations from '../initializations'

export default handleActions

  BED_SAVE: bedReducers.save
  BED_SAVE_ALL: bedReducers.saveAll
  BED_REMOVE: bedReducers.remove
  BED_REMOVE_ALL: bedReducers.removeAll
  BED_PATCH: bedReducers.patch

, initializations.bed
