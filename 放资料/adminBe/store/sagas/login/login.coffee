import loginSagas from '../../../models/login/effects'

export default ({
  service
}) =>

  loginSagas {
    type:
      save:   'LOGIN_SAVE'
      login:  'LOGIN_LOGIN'
      signup: 'LOGIN_SIGNUP'
    service
  }
