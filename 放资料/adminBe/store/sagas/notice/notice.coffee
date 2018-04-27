import noticeSagas from '../../../models/notice/effects'

export default ({
  service
}) =>
  noticeSagas {
    type:
      save:                  'NOTICE_SAVE'
      saveAll:               'NOTICE_SAVE_ALL'
      remove:                'NOTICE_REMOVE'
      create:                'NOTICE_CREATE'
      patch:                 'NOTICE_PATCH'
      fetch:                 'NOTICE_FETCH'
      reload:                'NOTICE_RELOAD'
      update:                'NOTICE_UPDATE'
      delete:                'NOTICE_DELETE'
    service
  }
    
  
    
