export default config = do =>
  header = 
    notices: do =>
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
  
  className = 
    name: 'Notices'

  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
    local_uri: "http://192.168.0.192:7001"
  
  notice = 
    create:
      headers: header.notices.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}?fetchWhenSave=true"
        local: =>
          "#{baseUri.local_uri}/notice"
      method: 'POST'
    
    update:
      headers: header.notices.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/notice/#{data.objectId}"
      method: 'PUT'
    
    fetch:
      headers: header.notices.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/notice/#{data.objectId}"
      method: 'GET'
    
    delete:
      headers: header.notices.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/notice/#{data.objectId}"
      method: 'DELETE'

    fetchAll:
      headers: header.notices.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}"
        local: =>
          "#{baseUri.local_uri}/notice"
      method: 'GET'
    
  # leancloud
  lc:
    notice:
      create:
        uri: notice.create.uri.lc
        headers: notice.create.headers
        method: notice.create.method
      update:
        uri: notice.update.uri.lc
        headers: notice.update.headers
        method: notice.update.method
      fetch:
        uri: notice.fetch.uri.lc
        headers: notice.fetch.headers
        method: notice.fetch.method
      delete:
        uri: notice.delete.uri.lc
        headers: notice.delete.headers
        method: notice.delete.method
      fetchAll:
        uri: notice.fetchAll.uri.lc
        headers: notice.fetchAll.headers
        method: notice.fetchAll.method
    
  # local
  local:
    notice:
      create:
        uri: notice.create.uri.local
        headers: notice.create.headers
        method: notice.create.method
      update:
        uri: notice.update.uri.local
        headers: notice.update.headers
        method: notice.update.method
      fetch:
        uri: notice.fetch.uri.local
        headers: notice.fetch.headers
        method: notice.fetch.method
      delete:
        uri: notice.delete.uri.local
        headers: notice.delete.headers
        method: notice.delete.method
      fetchAll:
        uri: notice.fetchAll.uri.local
        headers: notice.fetchAll.headers
        method: notice.fetchAll.method