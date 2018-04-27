var Mock = require('mockjs');

module.exports = {
  getComments: Mock.mock({
    "error": 0,
    "message": "success",
    "result|10": [{
      "id|+1":1,
      "author": "@cname",
      "comment": "@cparagraph",
      "date": '@date("yyyy-MM-dd")'
    }]
  }),
  addComments: Mock.mock({
    "error": 0,
    "message": "success",
    "result": []
  }),
  getComment: Mock.mock({
    "error": 0,
    "message": "success",
    "result|1": [{
      "id": 1,
      "author": "@cname",
      "comment": "@cparagraph",
      "date": '@date("yyyy-MM-dd")'
    }]
  })
};
