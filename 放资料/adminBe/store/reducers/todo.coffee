import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import todoReducers from '../../models/todo/reducers'
import initializations from '../initializations'

export default handleActions

  TODO_SAVE: todoReducers.save
  TODO_PATCH: todoReducers.patch
  TODO_REMOVE: todoReducers.remove
  TODO_SAVE_ALL: todoReducers.saveAll  
  TODO_REMOVE_ALL: todoReducers.removeAll

, initializations.todo
