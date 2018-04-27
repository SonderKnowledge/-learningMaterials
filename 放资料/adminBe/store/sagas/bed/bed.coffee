import getBedSagas from '../../../models/bed/effects'

export default ({
  service
}) => 
  getBedSagas {
    type:
      bedSave: 'BED_SAVE'
      bedSaveAll: 'BED_SAVE_ALL'
      bedPatch: 'BED_PATCH'
      bedRemove: 'BED_REMOVE'
    service
  }
    
