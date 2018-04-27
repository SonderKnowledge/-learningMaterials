import { promiseWrapper } from '../utils/promiseWrapper'

houseReload = (
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.houseReload
  }

houseFetch = (
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
    action: actions.houseFetch
    actionParams: {
      objectId
    }
  }

houseCreate = (
  {
    province
    city
    district
    communityAddress
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.houseCreate
    actionParams: {
      province
      city
      district
      communityAddress
    }
  }

houseUpdate = (
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
    action: actions.houseUpdate
    actionParams: {
      objectId
    }
  }

houseDelete = (
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
    action: actions.houseDelete
    actionParams: {
      objectId
    }
  }

export {
  houseReload
  houseFetch
  houseCreate
  houseUpdate
  houseDelete
}
