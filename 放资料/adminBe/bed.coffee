import { promiseWrapper } from '../utils/promiseWrapper'

bedReload = (
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.bedReload
  }

bedFetch = (
  {
    objectId
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.bedFetch
    actionParams: {
      objectId
    }
  }

bedCreate = (
  {
    idFreedom
    rentPrice
    payType
    belongToRoom
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.bedCreate
    actionParams: {
      idFreedom
      rentPrice
      payType
      belongToRoom
    }
  }

bedUpdate = (
  {
    objectId
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.bedUpdate
    actionParams: {
      objectId
    }
  }

bedDelete = (
  {
    objectId
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.bedDelete
    actionParams: {
      objectId
    }
  }

export {
  bedReload
  bedFetch
  bedCreate
  bedUpdate
  bedDelete
}
