export default config = do =>
  header = 
    tenants: do =>
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
  
  className = 
    name: 'Tenants'

  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
    local_uri: "http://192.168.0.192:7001"
  
  tenant = 
    create:
      headers: header.tenants.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}?fetchWhenSave=true"
        local: =>
          "#{baseUri.local_uri}/tenant"
      method: 'POST'
    
    update:
      headers: header.tenants.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}?fetchWhenSave=true"
        local: (data) =>
          "#{baseUri.local_uri}/tenant/#{data.objectId}"
      method: 'PUT'

    fetch:
      headers: header.tenants.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}?fetchWhenSave=true"
        local: (data) =>
          "#{baseUri.local_uri}/tenant/#{data.objectId}"
      method: 'GET'

    fetchAll:
      headers: header.tenants.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}"
        local: =>
          "#{baseUri.local_uri}/tenant"
      method: 'GET'
    
    delete:
      headers: header.tenants.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/tenant/#{data.objectId}"
      method: 'DELETE'

  # leancloud
  lc:
    tenant:
      create:
        uri: tenant.create.uri.lc
        headers: tenant.create.headers
        method: tenant.create.method
      update:
        uri: tenant.update.uri.lc
        headers: tenant.update.headers
        method: tenant.update.method
      fetch:
        uri: tenant.fetch.uri.lc
        headers: tenant.fetch.headers
        method: tenant.fetch.method
      fetchAll:
        uri: tenant.fetchAll.uri.lc
        headers: tenant.fetchAll.headers
        method: tenant.fetchAll.method
      delete:
        uri: tenant.delete.uri.lc
        headers: tenant.delete.headers
        method: tenant.delete.method
    
  # local
  local:
    tenant:
      create:
        uri: tenant.create.uri.local
        headers: tenant.create.headers
        method: tenant.create.method
      update:
        uri: tenant.update.uri.local
        headers: tenant.update.headers
        method: tenant.update.method
      fetch:
        uri: tenant.fetch.uri.local
        headers: tenant.fetch.headers
        method: tenant.fetch.method
      fetchAll:
        uri: tenant.fetchAll.uri.local
        headers: tenant.fetchAll.headers
        method: tenant.fetchAll.method
      delete:
        uri: tenant.delete.uri.local
        headers: tenant.delete.headers
        method: tenant.delete.method