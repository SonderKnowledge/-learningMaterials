/** 
 * Object.assign() 
 * 通过复制一个或者多个对象来创建一个新的对象
 * 语法: Object.assign(target, ...sources)
 * @param {target} 目标对象
 * @param {sources} 源对象
 * @returns 目标对象
 */

// TODO: Object.assign 不会跳过值为null和undefined的源对象

// 复制一个对象
var obj = { a: 1};
var copy = Object.assign({}, obj);
console.log(copy); // { a: 1}

// Object.assign是浅拷贝。假如源对象的属性值是一个指向对象的引用，它也只拷贝那个引用值
function test() {
  'use strict';

  let obj1 = { a: 0 , b: { c: 0}};
  let obj2 = Object.assign({}, obj1);
  console.log(JSON.stringify(obj2)); // { a: 0, b: { c: 0}}
  
  obj1.a = 1;
  console.log(JSON.stringify(obj1)); // { a: 1, b: { c: 0}}
  console.log(JSON.stringify(obj2)); // { a: 0, b: { c: 0}}
  
  obj2.a = 2;
  console.log(JSON.stringify(obj1)); // { a: 1, b: { c: 0}}
  console.log(JSON.stringify(obj2)); // { a: 2, b: { c: 0}}
  
  obj2.b.c = 3;
  console.log(JSON.stringify(obj1)); // { a: 1, b: { c: 3}}
  console.log(JSON.stringify(obj2)); // { a: 2, b: { c: 3}}
  
  // Deep Clone 深拷贝
  obj1 = { a: 0 , b: { c: 0}};
  let obj3 = JSON.parse(JSON.stringify(obj1));
  obj1.a = 4;
  obj1.b.c = 4;
  console.log(JSON.stringify(obj3)); // { a: 0, b: { c: 0}}
}

test();

// 合并对象
var o1 = { a: 1};
var o2 = { b: 2};
var o3 = { c: 3};

var obj = Object.assign(o1, o2, o3);
console.log(obj); // { a: 1, b: 2, c: 3}
console.log(o1); // { a: 1, b: 2, c: 3} 目标对象自身也会改变

// 合并具有相同属性的对象 
// 属性被后续参数中具有相同属性的其他对象覆盖
var o1 = { a: 1, b: 1, c: 1};
var o2 = { b: 2, c: 2};
var o3 = { c: 3};

var obj = Object.assign({}, o1, o2, o3);
console.log(obj); // { a: 1, b: 2, c: 3}

// 拷贝symbol类型的属性
var o1 = { a: 1 };
var o2 = { [Symbol('foo')]: 2 };

var obj = Object.assign({}, o1, o2);
console.log(obj); // { a : 1, [Symbol("foo")]: 2 } (cf. bug 1207182 on Firefox)
console.log(Object.getOwnPropertySymbols(obj)); // [Symbol(foo)]

// 继承属性和不可枚举属性是不能拷贝的
// foo是个继承属性
var obj = Object.create({ foo: 1}, {
  // bar 是个不可枚举属性
  bar: {
    value: 2 
  },

  // baz 是个自身可枚举属性
  baz: {
    value: 3,
    enumerable: true 
  }
});

var copy = Object.assign({}, obj);
console.log(copy); // { baz: 3}

// 原始类型会被包装为对象
var v1 = 'abc';
var v2 = true;
var v3 = 10;
var v4 = Symbol('foo');

var obj = Object.assign({}, v1, null, v2, undefined, v3, v4);
// 原始类型会被包装，null 和 undefined 会被忽略。
// 注意，只有字符串的包装对象才可能有自身可枚举属性。
console.log(obj); // { "0": "a", "1": "b", "2": "c" }

// 异常会打断后续拷贝任务
// target 的foo属性是个只读属性
var target = Object.defineProperty({}, 'foo', {
  value: 1,
  writable: false
});

Object.assign(target, {bar: 2}, {foo2: 3, foo: 3, foo3: 3}, {baz: 4});
// TypeError: "foo" is read-only
// 注意这个异常是在拷贝第二个源对象的第二个属性时发生的。

console.log(target.bar);  // 2，说明第一个源对象拷贝成功了。
console.log(target.foo2); // 3，说明第二个源对象的第一个属性也拷贝成功了。
console.log(target.foo);  // 1，只读属性不能被覆盖，所以第二个源对象的第二个属性拷贝失败了。
console.log(target.foo3); // undefined，异常之后 assign 方法就退出了，第三个属性是不会被拷贝到的。
console.log(target.baz);  // undefined，第三个源对象更是不会被拷贝到的。