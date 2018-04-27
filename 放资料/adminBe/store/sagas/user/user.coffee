import userSagas from '../../../models/users/effects'

export default ({
  service
}) =>
  userSagas {
    type:
      save:                  'USER_SAVE'
      saveAll:               'USER_SAVE_ALL'
      create:                'USER_CREATE'
      patch:                 'USER_PATCH' 
      fetch:                 'USER_FETCH'
      reload:                'USER_RELOAD'
      update:                'USER_UPDATE' 
      delete:                'USER_DELETE'       
      verUserEmail:          'USER_VER_EMAIL'
      resetUserPsd:          'USER_RESET_PSD'
      refreshToken:          'USER_REFRESH_TOKEN'
      resetUserSessionToken: 'USER_RESET_SESSIONTOKEN'    
      resetUserPsdWithEmail: 'USER_RESET_PSD_WITH_EMAIL'
    service
  }
    