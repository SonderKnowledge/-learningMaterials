import { promiseWrapper } from '../utils/promiseWrapper'

roomReload = (
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.roomReload
  }

roomFetch = (
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
    action: actions.roomFetch
    actionParams: {
      objectId
    }
  }

roomCreate = (
  {
    roomType
    belongToHouse
  }
  {
    store
    actions
  }
) =>
  promiseWrapper {
    store
    action: actions.roomCreate
    actionParams: {
      roomType
      belongToHouse
    }
  }

roomUpdate = (
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
    action: actions.roomUpdate
    actionParams: {
      objectId
    }
  }

roomDelete = (
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
    action: actions.roomDelete
    actionParams: {
      objectId
    }
  }

export {
  roomReload
  roomFetch
  roomCreate
  roomUpdate
  roomDelete
}
