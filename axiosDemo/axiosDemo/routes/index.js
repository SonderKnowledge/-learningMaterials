var express = require('express');
var axios = require('axios');
var router = express.Router();


/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });

axios.get('https://cnodejs.org/api/v1/topics').then((res)=>{
  // 返回cnode社区的标题  简单返回内容没有很复杂试试功能可用即可
  console.log('返回数据:::::::::>>>>>>', res.data.data[0].content)
})

// axios.post('https://ijydih2t.api.lncld.net/1.1/users',{
//   dataType: 'json',
//   headers:{
//     'Content-Type': 'application/json',
//     'X-LC-Id': 'IJyDIH2TMnUi39m5Venq7EIc-gzGzoHsz',
//     'X-LC-Key': 'W6mYomEmftaVOwzxmbcUfBFN',
//   },
//   data:{
//     username: '李四',
//     password: '123456'
//   }
// })
//   .then((res) => {
//     console.log(res);
//   })

module.exports = router;
