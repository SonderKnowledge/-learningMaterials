import tenantSagas from '../../../models/tenants/effects'

export default ({
  service
}) =>
  tenantSagas {
    type:
      save:                  'TENANT_SAVE'
      saveAll:               'TENANT_SAVE_ALL'
      userSave:              'USER_SAVE'
      userRemove:            'USER_REMOVE'    
      remove:                'TENANT_REMOVE'
      create:                'TENANT_CREATE'
      patch:                 'TENANT_PATCH' 
      fetch:                 'TENANT_FETCH'
      reload:                'TENANT_RELOAD'
      update:                'TENANT_UPDATE'
      delete:                'TENANT_DELETE'
    service
  }
    