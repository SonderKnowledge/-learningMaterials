export default config = do =>
  header = 
    users: do =>
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
    
  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1"
    local_uri: "http://192.168.0.192:7001"
  
  login = 
    signup:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/users"
        local: =>
          "#{baseUri.local_uri}/signup"
      method: 'POST'

    login:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/login"
        local: =>
          "#{baseUri.local_uri}/login"
      method: 'POST'
    
  # leancloud
  lc:
    login:
      signup:
        uri: login.signup.uri.lc
        headers: login.signup.headers
        method: login.signup.method

      login:
        uri: login.login.uri.lc
        headers: login.login.headers
        method: login.login.method
    
  # local
  local:
    login:
      login:
        uri: login.login.uri.local
        headers: login.login.headers
        method: login.login.method

      login:
        uri: login.login.uri.local
        headers: login.login.headers
        method: login.login.method