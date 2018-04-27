import getRoomSagas from '../../../models/room/effects'

export default ({
  service
}) =>
  getRoomSagas
    type:
      roomSave: 'ROOM_SAVE'
      roomSaveAll: 'ROOM_SAVE_ALL'
      roomPatch: 'ROOM_PATCH'
      roomRemove: 'ROOM_REMOVE'
    service
