import {
  getStore
  mergeReduce
} from 'cfx.redux'

import isEqual from 'is-equal'
import dd from 'ddeyes'
import { interfaceConfig } from '../utils/promiseWrapper'

export default (
  {
    appName
    urlConf: {
      host = 'localhost'
      port = '7001'
      prefix = ''
    }
    store: {
      constants
      actions
      initializations
      reducers
      sagas
    }
    mode = 'async'
    interfaces = {}    
    otherConf...
  }
) =>

  urlConf = {
    host: host
    port: port
    prefix: prefix
  }

  # mergeReduce
  if otherConf?.store?
  
    reducers = {
      reducers...
      store.reducers...
    } if store.reducers?

    initializations = {
      initializations...
      store.initializations...
    }

    constants = {
      constants...
      store.constants...
    }

    actions = {
      actions...
      store.actions...
    }

  # 筛选相同的不打印
  subscriber = (
    prevState
    nextState
    action
    dispatch
  ) =>
    return dd store.getState() if not isEqual prevState, nextState

  store = getStore {
    appName
    reducers: mergeReduce reducers
    , initializations
    sagas
    subscriber:
      async: subscriber
    # (
    #   if mode is 'async'
    #   then sagas: sagas {
    #     urlConf
    #   }
    #   else {}
    # )...
    # (
    #   if otherConf?.subscriber?
    #   then subscriber: {
    #     (
    #       if otherConf.subscriber.sync?
    #       then sync: otherConf.subscriber.sync
    #       else {}
    #     )...
    #     (
    #       if otherConf.subscriber.async? and
    #       ( mode is 'aync')
    #       then async: otherConf.subscriber.async
    #       else {}
    #     )...
    #   }
    # )...
  }

  api = interfaceConfig interfaces
  , {
    store
    actions
  }

  returnData = {
    store
    api
    _: {
      constants
      actions
      initializations
      reducers
      sagas
    }
  }
  
  if mode is 'async'
    {
      store
      api
      _: {
        returnData._...
        sagas
      }
    }
  else
    returnData
