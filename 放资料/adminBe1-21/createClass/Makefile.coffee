import 'shelljs/make'
import dd from 'ddeyes'
import urlencode from 'urlencode'
import config from './config'
import reqTool from '../../src/utils/reqTool'

target.all = =>
  dd config

target.class = =>
  
  length = config.className.length
  for i in [0...length]
    reqTool(
      "#{config.baseUri}/scan/classes/#{config.className[i]}"
      {
        method: 'GET'
        headers: config.master_header
      }
    )
    .then (data) =>
      if data.results unless []
        objectIds = data.results.reduce (r, c) =>
          [
            r...
            c.objectId
          ]
        , []
        for objectId in objectIds
          dd config.className[i]
          # reqTool(
          #   "#{config.baseUri}/#{config.className[i]}/#{objectId}"
          #   {
          #     method: 'DELETE'
          #     headers: config.base_header
          #   }
          # )
          # .then (data) =>
          #   console.log '删除完的data--->>>', data
          
          # .catch (error) =>
          #   dd error
    
    .catch (error) =>
      dd error