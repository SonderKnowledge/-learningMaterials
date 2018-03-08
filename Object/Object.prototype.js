/**
 * Object.prototype 属性表示Object的原型对象
 * 特点：
 * writable:     false
 * enumerable:   false
 * configurable: false
 */
// Object.prototype.constructor 
// 特定的函数用于创建一个对象的原型
function Tree(name) {
  this.name = name;
}

var theTree = new Tree("Redwood");
console.log( "theTree.constructor is " + theTree.constructor );

// Object,prototype.hasOwnProperty() 
// 返回一个布尔值表示某个对象是否含有指定的属性而且此属性非原型链继承
o = new Object();
o.prop = 'exists';

function change() {
  o.newprop = o.prop;
  delete o.prop;
}

console.log(o.hasOwnProperty('prop'));
change()
console.log(o.hasOwnProperty('prop'));
