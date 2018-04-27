export default
 # 只传进来分reducer控制的那部分State，是一个数组
  save: (state, action) =>
    [
      state...
      action.payload
    ]

  saveAll: (state, action) =>
    action.payload


  remove: (state, action) =>
    newArray = state.filter (value) =>
      value.objectId isnt action.payload.objectId

  removeAll: (state, action) =>
    []

  patch: (state, action) =>
    newArray = state.map (value) =>
      if value.objectId is action.payload.objectId
        action.payload
      else
        value
