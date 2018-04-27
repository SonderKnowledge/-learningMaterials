var jwt = require('jsonwebtoken');
token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvYmplY3RJZCI6IjVhNjQ2ODM2MGI2MTYwMDA0Mzk0OTVjMSIsInNlc3Npb25Ub2tlbiI6IiIsInVzZXJuYW1lIjoi6ZmI5qyiIiwiZGF0ZVRpbWUiOjE1MTgzMTQ5NTA1ODQsImlhdCI6MTUxODMxNDk1MH0.ZcxKs_n_heO-2Ib7zsvgHdINFBvlth0sDWUkmmU1wZs'

varifyToken = (token) => {
  decoded = jwt.verify(token, 'shhh')
  console.log(decoded.objectId)
}
varifyToken(token)

// getToken = (
//   objectId,
//   sessionToken,
//   dateTime,
//   username
// ) => {
//   data = jwt.sign({
//     objectId: objectId,
//     sessionToken: sessionToken,
//     username: username,
//     dateTime: dateTime
//   }, 'shhh')
//   console.log(data)
// }
// getToken(
//   '5a6468360b616000439495c1',
//   '',
//   Date.now(),
//   '陈欢'
// )