import dd from 'ddeyes'
import {
  getUrlObjs
  getGroupServices
} from './utils'
import business from './business'

export default ({
  urlConf
  request
}) =>

  urlObjs = getUrlObjs {
    urlConf
    business
  }

  getGroupServices {
    urlObjs
    request
  }
