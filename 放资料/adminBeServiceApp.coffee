# import fs from 'fs'
# import request from './utils/request'
# import { getUrlObjs, getGroupServices } from 'cfx.service'
import { verifyToken } from './utils/jsonWebToken'
import getService from 'cfx.service'
import urlConf from '../urlConf'

module.exports = (app) ->
  app.beforeStart () ->
    # dbConfig = await JSON.parse fs.readFileSync('dbConfig.json', 'utf8')
    # baseString = dbConfig.Id[0..7].toLowerCase()

    # urlConf =
    #   withSSL: true
    #   host: "#{baseString}.api.lncld.net"
    #   port: 80
    #   prefix: '1.1'
    #   headers:
    #     "X-LC-Id": dbConfig.Id
    #     "X-LC-Key": dbConfig.Key

    # business = {
    #   login:

    #     signup: ({
    #       request
    #       baseUrl
    #       headers
    #     }) =>
    #       (data) =>
    #         url = "#{baseUrl}/users"
    #         request url
    #         , {
    #           method: 'post'
    #           headers: headers
    #           data
    #         }

    #     login: ({
    #       request
    #       baseUrl
    #       headers
    #     }) =>
    #       (data) =>
    #         url = "#{baseUrl}/login"
    #         request url
    #         , {
    #           method: 'post'
    #           headers: headers
    #           data
    #         }

        # resetPsd: ({
        #   request
        #   baseUrl
        #   headers
        # }) =>
        #   (data) =>
        #     objectId = verifyToken(data.token).objectId
        #     url = "#{baseUrl}/users/#{objectId}/updatePassword"
        #     newHeaders = {
        #       headers...
        #       'X-LC-Session': verifyToken(data.token).sessionToken
        #     }
        #     request url
        #     , {
        #       method: 'put'
        #       headers: newHeaders
        #       data
        #     }
    #   'Person'
    #   'Landlords'
    #   'Tenants'
    #   'Todos'
    #   'Notices'
    #   'Houses'
    #   'Rooms'
    #   'Beds'
    #   'Rents'
    # }

    # urlObjs = getUrlObjs {
    #   urlConf
    #   business
    # }

    # services = getGroupServices {
    #   urlObjs
    #   request
    # }

    business = {
      login:
      
        register:
          uri: ({
            baseUrl
          }) => "#{baseUrl}/users"
          method: 'POST'

        login: ({
          request
          baseUrl
          headers
        }) =>
          ({
            username
            password
            otherParams...
          }) =>
            request "#{baseUrl}/login"
            , {
              method: 'POST'
              headers
              data: {
                username
                password
                otherParams...
              }
            }

        resetPsd: ({
          request
          baseUrl
          headers
        }) =>
          (data) =>
            objectId = verifyToken(data.token).objectId
            url = "#{baseUrl}/users/#{objectId}/updatePassword"
            newHeaders = {
              headers...
              'X-LC-Session': verifyToken(data.token).sessionToken
            }
            request url
            , {
              method: 'put'
              headers: newHeaders
              data
            }
      'Person'
      'Landlords'
      'Tenants'
      'Todos'
      'Notices'
      'Houses'
      'Rooms'
      'Beds'
      'Rents'
    }

    services = getService {
      urlConf
      business
    }

    app.dbServices = services
    return
  return
