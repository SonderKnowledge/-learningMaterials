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
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
    local_uri: "http://192.168.0.192:7001"
  
  className = 
    name: 'Person'

  users = 
    create:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}?fetchWhenSave=true"
        local: =>
          "#{baseUri.local_uri}/user"
      method: 'POST'
    
    fetch:
      headers: header.users.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/user/#{data.objectId}"
      method: 'GET'
    
    fetchAll:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}"
        local: =>
          "#{baseUri.local_uri}/user"
      method: 'GET'
    
    verEmail:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/requestEmailVerify"
        local: =>
          "#{baseUri.local_uri}/requestEmailVerify"
      method: 'POST'

    resetPsdWithEmail:
      headers: header.users.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/requestPasswordReset"
        local: =>
          "#{baseUri.local_uri}/requestPasswordReset"
      method: 'POST'

    resetPsd:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}/updatePassword"
        local: (data) =>
          "#{baseUri.local_uri}/#{data.objectId}/updatePassword"
      method: 'PUT'

    update:
      headers: header.users.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}?fetchWhenSave=true"
        local: (data) =>
          "#{baseUri.local_uri}/user/#{data.objectId}"
      method: 'PUT'
    
    resetSessionToken:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}/refreshSessionToken"
        local: (data) =>
          "#{baseUri.local_uri}/#{className.name}/#{data.objectId}/refreshSessionToken"
      method: 'PUT'

    delete:
      headers: header.users.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/user/#{data.objectId}"
      method: 'DELETE'
    
  lc:
    users:
      create:
        uri: users.create.uri.lc
        headers: users.create.headers
        method: users.create.method
      
      fetch:
        uri: users.fetch.uri.lc
        headers: users.fetch.headers
        method: users.fetch.method
      
      fetchAll:
        uri: users.fetchAll.uri.lc
        headers: users.fetchAll.headers
        method: users.fetchAll.method
      
      verEmail:
        uri: users.verEmail.uri.lc
        headers: users.verEmail.headers
        method: users.verEmail.method
      
      resetPsdWithEmail:
        uri: users.resetPsdWithEmail.uri.lc
        headers: users.resetPsdWithEmail.headers
        method: users.resetPsdWithEmail.method

      resetPsd:
        uri: users.resetPsd.uri.lc
        headers: users.resetPsd.headers
        method: users.resetPsd.method
      
      update:
        uri: users.update.uri.lc
        headers: users.update.headers
        method: users.update.method
      
      resetSessionToken:
        uri: users.resetSessionToken.uri.lc
        headers: users.resetSessionToken.headers
        method: users.resetSessionToken.method
      
      delete:
        uri: users.delete.uri.lc
        headers: users.delete.headers
        method: users.delete.method
    
  local:
    users:
      create:
        uri: users.create.uri.local
        headers: users.create.headers
        method: users.create.method

      fetch:
        uri: users.fetch.uri.local
        headers: users.fetch.headers
        method: users.fetch.method
      
      fetchAll:
        uri: users.fetchAll.uri.local
        headers: users.fetchAll.headers
        method: users.fetchAll.method
      
      verEmail:
        uri: users.verEmail.uri.local
        headers: users.verEmail.headers
        method: users.verEmail.method
      
      resetPsdWithEmail:
        uri: users.resetPsdWithEmail.uri.local
        headers: users.resetPsdWithEmail.headers
        method: users.resetPsdWithEmail.method

      resetPsd:
        uri: users.resetPsd.uri.local
        headers: users.resetPsd.headers
        method: users.resetPsd.method
      
      update:
        uri: users.update.uri.local
        headers: users.update.headers
        method: users.update.method
      
      resetSessionToken:
        uri: users.resetSessionToken.uri.local
        headers: users.resetSessionToken.headers
        method: users.resetSessionToken.method
      
      delete:
        uri: users.delete.uri.local
        headers: users.delete.headers
        method: users.delete.method

verEmail: (getUserService config.lc.users).verEmail
  resetPsd: (getUserService config.lc.users).resetPsd
  resetSessionToken: (getUserService config.lc.users).resetSessionToken  
  resetPsdWithEmail: (getUserService config.lc.users).resetPsdWithEmail

 verEmail: (getUserService config.local.users).verEmail
  resetPsd: (getUserService config.local.users).resetPsd
  resetSessionToken: (getUserService config.local.users).resetSessionToken  
  resetPsdWithEmail: (getUserService config.local.users).resetPsdWithEmail