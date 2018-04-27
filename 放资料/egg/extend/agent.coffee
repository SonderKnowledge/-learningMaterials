import dd from 'ddeyes'

export default (config) ->
  reload: (request) ->
    request config.reload.uri()
    ,
      method: config.reload.method
      headers: config.reload.headers
