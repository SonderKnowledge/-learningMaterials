export default config = do =>
  header = 
    landlords: do =>
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
  
  className = 
    name: 'Landlords'

  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
    local_uri: "http://192.168.0.192:7001"
  
  landlord = 
    create:
      headers: header.landlords.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}?fetchWhenSave=true"
        local: =>
          "#{baseUri.local_uri}/landlord"
      method: 'POST'
    
    update:
      headers: header.landlords.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}?fetchWhenSave=true"
        local: (data) =>
          "#{baseUri.local_uri}/landlord/#{data.objectId}"
      method: 'PUT'

    delete:
      headers: header.landlords.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/landlord/#{data.objectId}"
      method: 'DELETE'

    fetch:
      headers: header.landlords.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}?fetchWhenSave=true"
        local: (data) =>
          "#{baseUri.local_uri}/landlord/#{data.objectId}"
      method: 'GET'

    fetchAll:
      headers: header.landlords.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}"
        local: =>
          "#{baseUri.local_uri}/landlord"
      method: 'GET'
    
    fetchUserLandlord:
      headers: header.landlords.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}"
        local: (data)=>
          "#{baseUri.local_uri}/user/landlord/#{data.userId}"
      method: 'GET'
    
  # leancloud
  lc:
    landlord:
      create:
        uri: landlord.create.uri.lc
        headers: landlord.create.headers
        method: landlord.create.method
      update:
        uri: landlord.update.uri.lc
        headers: landlord.update.headers
        method: landlord.update.method
      delete:
        uri: landlord.delete.uri.lc
        headers: landlord.delete.headers
        method: landlord.delete.method
      fetch:
        uri: landlord.fetch.uri.lc
        headers: landlord.fetch.headers
        method: landlord.fetch.method
      fetchAll:
        uri: landlord.fetchAll.uri.lc
        headers: landlord.fetchAll.headers
        method: landlord.fetchAll.method
      fetchUserLandlord:
        uri: landlord.fetchUserLandlord.uri.lc
        headers: landlord.fetchUserLandlord.headers
        method: landlord.fetchUserLandlord.method
    
  # local
  local:
    landlord:
      create:
        uri: landlord.create.uri.local
        headers: landlord.create.headers
        method: landlord.create.method
      update:
        uri: landlord.update.uri.local
        headers: landlord.update.headers
        method: landlord.update.method
      delete:
        uri: landlord.delete.uri.local
        headers: landlord.delete.headers
        method: landlord.delete.method
      fetch:
        uri: landlord.fetch.uri.local
        headers: landlord.fetch.headers
        method: landlord.fetch.method
      fetchAll:
        uri: landlord.fetchAll.uri.local
        headers: landlord.fetchAll.headers
        method: landlord.fetchAll.method
      fetchUserLandlord:
        uri: landlord.fetchUserLandlord.uri.local
        headers: landlord.fetchUserLandlord.headers
        method: landlord.fetchUserLandlord.method