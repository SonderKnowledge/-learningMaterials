import uuid from 'uuid'
# import getServices from '../../services/bed'
# import validate from '../../utils/validate'

export default ({
  type
  service
}) ->
  # 查 无对应
  # 实际包含两个动作
  # 一 查到一条记录
  # 二 发起同步action修改状态，把拿到的记录存进去
  # 覆盖 saveall
  reload: (
    { payload }
    { put }
  ) ->
    console.log '这里是 bed model reload 调用Service'
    result = yield service.reload()

    if result?
      yield put
        type: type.bedSaveAll
        payload: result.results
      yield payload.success result.results
    else
      yield payload.fail 'bed reload error'

    return

  fetch: (
    { payload }
    { put }
  ) ->
    console.log '这里是 bed model fetch 调用Service'
    validate.exist payload
    , [ 'objectId' ]

    result = yield service.fetch payload.objectId

    if result?
      yield put
        type: type.bedSave
        payload: result
      yield payload.success result
    else
      yield payload.fail 'bed fetch error'
    return

  # 增一个 save
  create: (
    { payload }
    { put }
  ) ->
    console.log '这里是 bed model create 调用Service'
    validate.exist payload,['isFreedom', 'rentPrice', 'payType', 'belongToRoom']

    result = yield service.create payload

    if result?
      yield put
        type: type.bedSave
        payload: result
      yield payload.success result
    else
      yield payload.fail 'bed create error'
    return

  # 改 patch
  update: ({payload}, {put}) ->
    console.log '这里是 bed model update 调用Service'
    validate.exist payload,['objectId']

    yield service.update payload
    result = yield service.fetch payload.objectId

    if result?
      yield put
        type: type.bedPatch
        payload: result
      yield payload.success result
    else
      yield payload.fail 'bed update error'
    return

  # 删 remove
  delete: (
    { payload }
    { put }
  ) ->
    console.log '这里是 bed model delete 调用Service'
    validate.exist payload,['objectId']

    result = yield service.delete payload.objectId

    if result?
      yield put
        type: type.bedRemove
        payload:
          objectId: payload.objectId
      yield payload.success payload.objectId
    else
      yield payload.fail 'bed delete error'

    return

# # 增加多个，暂时没用
#   createAll: (action, {put}) ->
#     console.log '这里是 bed model reload 调用Service'
#     results = []
#     for value in payload.array
#       try
#         # validate.exist payload,['isOnline', 'province', 'city', 'district', 'communityAddress']
#         result = yield services.create value
#       catch error
#         console.log '调用出错'
#         throw new Error error
#       results[results.length] = result
#
#     newAction =
#       type: type.bedSaveAll
#       payload:
#         array: results
#
#     console.log 'createAll调用成功，修改状态'
#     yield put newAction
#
#     return
