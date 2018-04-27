import getHouseSagas from '../../../models/house/effects'

export default ({
  service
}) =>
  getHouseSagas
    type:
      houseSave: 'HOUSE_SAVE'
      houseSaveAll: 'HOUSE_SAVE_ALL'
      housePatch: 'HOUSE_PATCH'
      houseRemove: 'HOUSE_REMOVE'
    service