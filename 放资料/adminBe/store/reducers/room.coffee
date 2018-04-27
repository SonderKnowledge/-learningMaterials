import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import roomReducers from '../../models/room/reducers'
import initializations from '../initializations'

export default handleActions

  ROOM_SAVE: roomReducers.save
  ROOM_SAVE_ALL: roomReducers.saveAll
  ROOM_REMOVE: roomReducers.remove
  ROOM_REMOVE_ALL: roomReducers.removeAll
  ROOM_PATCH: roomReducers.patch

, initializations.room