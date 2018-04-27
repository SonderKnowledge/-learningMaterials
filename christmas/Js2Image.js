var Js2Image = require('js2image');
var fs = require('fs');

var image = './resource/tree.png';
var source = './resource/jquery.js';
var target = './target/xmas.js';
var options = {};

// 获取结果的code
var sourceCode = fs.readFileSync(source);
Js2Image.getCode(sourceCode, image, options).then(function (code) {
  // code为生成的代码
  console.log(code);
})

// 或者直接写入文件
Js2Image.writeToFile(source, image, target, options).then(function (code) {
  // 生成的代码已被写入到文件target
  // code为生成的代码
  console.log(code);
});