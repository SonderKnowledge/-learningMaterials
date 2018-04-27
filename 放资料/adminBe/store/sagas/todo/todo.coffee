import todoSagas from '../../../models/todo/effects'

export default ({
  service
}) =>
  todoSagas {
    type:
      save:                  'TODO_SAVE'
      saveAll:               'TODO_SAVE_ALL'
      create:                'TODO_CREATE'
      fetch:                 'TODO_FETCH'
      patch:                 'TODO_PATCH'    
      reload:                'TODO_RELOAD'
      update:                'TODO_UPDATE'
      delete:                'TODO_DELETE'
    service
  }
    