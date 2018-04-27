export default {
  # login:
  #   signup:
  #     method: 'POST'
  #   login:
  #     method: 'POST'
  #   resetPsd
  # signup: ({
  #   request
  #   baseUrl
  #   headers
  # }) =>
  #   (data) =>
  #     url = "#{baseUrl}/users"
  #     request url
  #     , {
  #       method: 'POST'
  #       headers: headers
  #       data
  #     }

  login: ({
    request
    baseUrl
    headers
  }) =>
    (data) =>
      url = "#{baseUrl}/login"
      request url
      , {
        method: 'post'
        headers: headers
        data
      }
  # 'login'
  'user'
  'person'
  'landlord'
  'tenant'
  'todo'
  'notice'
  'house'
  'bed'
  'room'
  'rend'
}
