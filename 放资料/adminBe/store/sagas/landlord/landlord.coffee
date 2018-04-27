import landlordSagas from '../../../models/landlords/effects'

export default ({
  service
}) =>
  landlordSagas {
    type:
      save:                  'LANDLORD_SAVE'
      userSave:              'USER_SAVE'
      userRemove:            'USER_REMOVE'
      remove:                'LANDLORD_REMOVE'
      saveAll:               'LANDLORD_SAVE_ALL'
      create:                'LANDLORD_CREATE'
      patch:                 'LANDLORD_PATCH' 
      fetch:                 'LANDLORD_FETCH'
      reload:                'LANDLORD_RELOAD'
      update:                'LANDLORD_UPDATE'
      delete:                'LANDLORD_DELETE'
    service
  }
    