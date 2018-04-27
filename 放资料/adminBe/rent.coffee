import { promiseWrapper } from '../utils/promiseWrapper'

rentReload = (
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.rentReload
  }

rentFetch = (
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
    action: actions.rentFetch
    actionParams: {
      objectId
    }
  }

rentCreate = (
  {
    type
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.rentCreate
    actionParams: {
      type
    }
  }

rentUpdate = (
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
    action: actions.rentUpdate
    actionParams: {
      objectId
    }
  }

rentDelete = (
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
    action: actions.rentDelete
    actionParams: {
      objectId
    }
  }

export {
  rentReload
  rentFetch
  rentCreate
  rentUpdate
  rentDelete
}
