
// let arr = ['1', '2', '3', '4', '5'];

// data1 = arr.reduce((r, c) => {
//   return [
//     ...r,
//     `${c}`
//   ];
// }, []);

// console.log('data1--->>', data1);

// data2 = arr.reduce((r, c) => {
//   return {
//     ...r,
//     [ref = `${c}`]: ref
//   };
// }, {});

// console.log('data2--->>>', data2);


// var _extends = Object.assign || function (target) { 
//   for (var i = 1; i < arguments.length; i++) { 
//     var source = arguments[i]; 
//     for (var key in source) {
//       if (Object.prototype.hasOwnProperty.call(source, key)) { 
//         target[key] = source[key];
//       } 
//     } 
//   } 
//   return target; 
// };

// data3 = arr.reduce((r, c) => {
//   return _extends({}, r, {[ref = `${c}`]: ref});
// }, {})

// console.log(data3);

