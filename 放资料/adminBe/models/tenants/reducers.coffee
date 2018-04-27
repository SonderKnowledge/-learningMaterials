import dd from 'ddeyes'

export default
  save: (
    state
    {
      payload:
        tenants: tenants
    }
  ) =>
    [
      state...
      tenants
    ]
  
  patch: (
    state
    {
      payload:
        tenants: tenants
    }
  ) =>
    temp = []
    state.reduce (result, current, _index, array) =>
      if current.objectId is tenants.objectId
        temp = JSON.parse JSON.stringify array
        temp[_index].tenantInfo = tenants.tenantInfo
    , []
    temp
  
  remove: (
    state
    {
      payload:
        tenants: tenants
    }
  ) =>
    temp = []   
    state.reduce (result, current, _index, array) =>
      if current.objectId is tenants.objectId
        temp = JSON.parse JSON.stringify array
        temp.splice _index, 1
    , []
    temp

  saveAll: (
    state
    {
      payload:
        tenants: tenants
    }
  ) =>
    [
      tenants.results...
    ]