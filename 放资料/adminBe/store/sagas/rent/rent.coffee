import getRentSagas from '../../../models/rent/effects'

export default ({
  service
}) =>
  getRentSagas
    type:
      rentSave: 'RENT_SAVE'
      rentSaveAll: 'RENT_SAVE_ALL'
      rentPatch: 'RENT_PATCH'
      rentRemove: 'RENT_REMOVE'
    service
