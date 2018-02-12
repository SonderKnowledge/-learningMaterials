const readline = require('readline');
const fs = require('fs');

/**
 * 读取node_modules下的index.js并忽略其中一行代码然后覆盖之前的文件
 * 第一种写法
 */
const rl = readline.createInterface({
  input: fs.createReadStream('./node_modules/react-fa/lib/index.js')
});

const data = "require('font-awesome/css/font-awesome.css');"

rl.on('line', (line) => {
  if(line !== data){
    try {
      fs.appendFile('./a.txt', `${line}\n`, function () {});
    }
    catch (error) {
      console.log(error);
    } 
  }
});

/**
 * 第一种写法
 */
const text = fs.readFileSync('./node_modules/react-fa/lib/index.js', 'utf8');
const ignoreLine = "require('font-awesome/css/font-awesome.css');"
// 将文件按行拆成数组
text.split(/\r?\n/).forEach(function (line) {
  if(line !== ignoreLine){
    try {
      fs.appendFile('./a.txt', `${line}\n`, function () {});
    }
    catch (error) {
      console.log(error);
    }   
  }
});

