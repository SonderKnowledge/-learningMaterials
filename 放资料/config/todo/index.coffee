export default config = do =>
  header = 
    todos: do =>
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
  
  className = 
    name: 'Todos'

  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
    local_uri: "http://192.168.0.192:7001"
  
  todo = 
    create:
      headers: header.todos.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}?fetchWhenSave=true"
        local: =>
          "#{baseUri.local_uri}/todo"
      method: 'POST'
    
    update:
      headers: header.todos.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/todo/#{data.objectId}"
      method: 'PUT'
    
    fetch:
      headers: header.todos.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/todo/#{data.objectId}"
      method: 'GET'
    
    delete:
      headers: header.todos.base
      uri:
        lc: (data) =>
          "#{baseUri.lc_uri}/#{className.name}/#{data.objectId}"
        local: (data) =>
          "#{baseUri.local_uri}/todo/#{data.objectId}"
      method: 'DELETE'

    fetchAll:
      headers: header.todos.base
      uri:
        lc: =>
          "#{baseUri.lc_uri}/#{className.name}"
        local: =>
          "#{baseUri.local_uri}/todo"
      method: 'GET'
    
  # leancloud
  lc:
    todo:
      create:
        uri: todo.create.uri.lc
        headers: todo.create.headers
        method: todo.create.method
      update:
        uri: todo.update.uri.lc
        headers: todo.update.headers
        method: todo.update.method
      fetch:
        uri: todo.fetch.uri.lc
        headers: todo.fetch.headers
        method: todo.fetch.method
      delete:
        uri: todo.delete.uri.lc
        headers: todo.delete.headers
        method: todo.delete.method
      fetchAll:
        uri: todo.fetchAll.uri.lc
        headers: todo.fetchAll.headers
        method: todo.fetchAll.method
    
  # local
  local:
    todo:
      create:
        uri: todo.create.uri.local
        headers: todo.create.headers
        method: todo.create.method
      update:
        uri: todo.update.uri.local
        headers: todo.update.headers
        method: todo.update.method
      fetch:
        uri: todo.fetch.uri.local
        headers: todo.fetch.headers
        method: todo.fetch.method
      delete:
        uri: todo.delete.uri.local
        headers: todo.delete.headers
        method: todo.delete.method
      fetchAll:
        uri: todo.fetchAll.uri.local
        headers: todo.fetchAll.headers
        method: todo.fetchAll.method