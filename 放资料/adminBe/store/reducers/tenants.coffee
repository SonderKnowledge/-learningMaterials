import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import tenantReducers from '../../models/tenants/reducers'
import initializations from '../initializations'

export default handleActions

  TENANT_SAVE: tenantReducers.save
  TENANT_PATCH: tenantReducers.patch
  TENANT_REMOVE: tenantReducers.remove
  TENANT_SAVE_ALL: tenantReducers.saveAll  
  TENANT_REMOVE_ALL: tenantReducers.removeAll

, initializations.tenant
