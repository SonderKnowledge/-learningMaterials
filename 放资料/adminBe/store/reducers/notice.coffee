import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import noticeReducers from '../../models/notice/reducers'
import initializations from '../initializations'

export default handleActions

  NOTICE_SAVE: noticeReducers.save
  NOTICE_PATCH: noticeReducers.patch
  NOTICE_REMOVE: noticeReducers.remove
  NOTICE_SAVE_ALL: noticeReducers.saveAll
  NOTICE_REMOVE_ALL: noticeReducers.removeAll

, initializations.notice
