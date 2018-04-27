import config from './config'
import agentService from './agent'

export default
  lc:
    reload: (agentService config.lc).reload

  local:
    reload: (agentService config.local).reload