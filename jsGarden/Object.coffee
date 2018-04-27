import dd from 'ddeyes'

# 对象使用和属性 js中所有变量都可以当做对象使用除了 null 和 undefined
export default ->
  dd false.toString() # 'false'
  dd [1, 2, 3].toString() # '1,2,3'

  Foo =  ->
  Foo.bar = 1
  dd Foo.bar # 1
 
  # 2.toString() 出错SyntaxError
  # dd 2..toString() # 报错
  dd 2 .toString() # 点号前面有空格可以正常解析
  dd (2).toString() # 2先被计算

# 对象作为数据类型 js的对象可以作为哈希表使用，主要用来保存命名
# 的键与指的对应关系，使用对象字面语法 {}可以创建一个简单对象。
# 新创建的对象从Object.prototype继承下面，没有任何自定义属性
  foo = {} # 创建一个空对象
  bar = { test: 12 } # 创建一个新对象拥有值为12的自定义属性 'test'

  # 访问属性 两种方式：点操作符或者 中括号操作符
  foo = {name: 'Kitten'}
  dd foo.name # Kitten
  dd foo['name']

  get = 'name'
  foo[get] # Kitten

  # foo.1234 # SyntaxError
  foo['1234'] # 不会报错

  # 删除属性唯一方法是delete操作符，设置属性为 undefined或 null
  # 并不能真正的删除属性而仅仅是移除了属性和值的关联
  obj = {
    bar: 1
    baz: 2
    ban: 3
  }
  obj.bar = undefined
  obj.baz = null
  delete obj.ban
  dd obj.bar
  dd obj.baz
  for i of obj
    if obj.hasOwnProperty(i)
      dd obj[i], i