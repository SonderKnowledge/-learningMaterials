// let classes = ['a', 'b', 'c', 'd'];

// data = classes.reduce((result, current, index, array) => {
//   return {
//     ...result,
//     [ref = `${current}`]: ref
//   }
// }, {});

// console.log(data);


// let arr = [];
// for (let i = 0; i < 100000000; i++) {
//   arr.push(1);
// }
// console.log(arr.length);

// const arr = new Uint16Array(100000000);

// const buf = Buffer.from(arr.buffer, 0, 100000000);

// console.log(buf.length);


// const buf1 = Buffer.from([1, 2, 3]);

// for (const b of buf1) {
//   console.log(b);
// }

// map是一组键值对的结构，具有极快的查找速度
// 一个key只能对应一个value，所以，多次对一个key放入value，后面的值会把前面的值冲掉
// let iterable = new Map([["a", 1], ["b", 2], ["c", 3]]);

// for (let [key, value] of iterable) {
//   console.log(value);
// }
// // 1
// // 2
// // 3

// for (let entry of iterable) {
//   console.log(entry);
// }
// // [a, 1]
// // [b, 2]
// // [c, 3]

// Set和Map类似，也是一组key的集合，但不存储value。由于key不能重复，所以，在Set中，没有重复的key
// let iterable = new Set([1, 1, 2, 2, 3, 3]);

// for (let value of iterable) {
//   console.log(value);
// }
// // 1
// // 2
// // 3


// 递归
// function sum(n){
//   if(n==1) return 1;
//   return sum(n-1) + n;
// }
// function sum(n){
//   if(n==1) return 1;
//   return sum(n-1) + n;
// }
// data = sum(100);
// console.log(data);

// 深拷贝
/**
 * 解决了原型链问题的深拷贝
 * @param obj
 * @returns {*}
//  */
// var deepCopyOfObject = function(obj) {
//     var Constructor = obj.constructor,
//         newObj = null,
//         key;
//     if (typeof obj == 'object') {
//         newObj = new Constructor();
//         if (obj instanceof Array) {
//             for (key in obj) {
//                 if (typeof obj[key] == 'object') {
//                     newObj.push(deepCopyOfObject(obj[key]));
//                 } else {
//                     newObj.push(obj[key]);
//                 }
//             }
//         } else {
//             for (key in obj) {
//                 if (typeof obj[key] == 'object') {
//                     newObj[key] = deepCopyOfObject(obj[key]);
//                 } else {
//                     newObj[key] = obj[key];
//                 }
//             }
//         }
//     } else {
//         newObj = obj;
//     }
//     return newObj;
// };

// 浅拷贝
let obj = {
  name: 'Marry',
  age: 22,
  sex: '男'
}
function shallowCopy(obj) {
  var copy = {};
  // 只复制可遍历的属性
  for (key in obj) {
      // 只复制本身拥有的属性
      if (obj.hasOwnProperty(key)) {
          copy[key] = obj[key];
      }
  }
  return copy;
}

result = shallowCopy(obj);
console.log(result);
result.name = 'Jack'
console.log(result);
console.log(obj);