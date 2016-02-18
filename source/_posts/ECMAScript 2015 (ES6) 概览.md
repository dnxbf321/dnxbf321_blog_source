title: "ECMAScript 2015 (ES6) 概览"
date: 2016-01-05 10:00:20
layout: post
categories:
- 前端
tags:
- 前端
- Javascript
---

## Sublime Text 中运行 ES6

1. 安装最新版的 node

2. 配置新的 build 系统

    1. 打开 Tools -> Build System -> New Build System…

    2. 编辑如下：{ "cmd": ["/usr/local/bin/node", "--use-strict", "--harmony_destructuring", "$file"], "selector": "source.js"}

    3. 保存成 ES6.sublime-build 到默认路径

3. 测试

    1. 编辑 test.js

    ```js
    let [foo, bar] = [1, 2];
    console.log(foo, bar);
    ```
    2. 运行: Cmd + B

    3. 控制台输出：1 2

## ECMAScript 2015 (ES6) 简介

ECMAScript 6 是 JavaScript 语言的新一代标准，它于2000年开始制定，历经15年，终于在2015年6月正式发布了。它的目标，是使得 JavaScript 语言可以用来编写复杂的大型应用程序，成为企业级开发语言。

## let 和 const

let 声明局部变量，为Javascript 新增了块级作用域，不允许在同一作用域内，重复声明同一个变量

const 声明常量，必须初始化，一旦声明，不许改变

let 和 const 变量声明不提升

## 变量的解构赋值

ES6允许按照一定模式，从数组和对象中提取值，对变量进行赋值，这被称为解构。

解构赋值便于我们一次性声明多个变量，方便提取函数返回值、JSON 数据，允许设置默认值。

### 数组的解构赋值 模式匹配

  ```js
  var [a, [b, c]] = [1, [2, 3]];
  ```

  解构不成功，变量的值就等于 undefined

  ```js
  var [a, b] = [1];
  ```

  不完全解构

  ```js
  var [a, [b], c] = [1, [2, 3], 4];
  ```

  解构赋值指定默认值

  ```js
  var [a, b=2] = [1];
  ```

### 对象的解构赋值

  变量必须与属性同名
  ```js
  var {a, b} = {a: 1, b: 2};
  ```

  变量名与属性名不一致是，必须写成下面这样
  ```js
var {a: renameA, b} = {a: 1, b: 2};
// a 不被赋值，renameA = 1
  ```

  解构用于嵌套结构。可把数据结构看成树，仅叶子被解析赋值，其他节点均仅为模式（undefined）。
  ```js
var obj = {
  p: [
    "Hello",
    { y: "World" }
  ]
};
var { p: [x, { y }] } = obj;
// p 仅是模式，不会被赋值，p error undefined
var { p } = obj;
// p = ["hello, {y: "World"}"]
  ```

### 字符串的解构赋值

  字符串被转换成一个类似数组的对象，类似 'hello'.split('')，按照对象解构赋值的规则进行

  ```js
  const [a, b, c, d, e] = 'hello';
  ```

  字符串作为字符串对象进行解构赋值

  ```js
  let {length: len} = 'hello';
  ```

### 数值和布尔值的解构赋值

  将数值和布尔值先转换成对象，再按照对象的规则进行

### null, undefined 无法转换成对象，不能进行解构赋值


## 模板字符串

用反引号(`)标识。它可以当作普通字符串使用，也可以用来定义多行字符串，或者在字符串中嵌入变量。

  ```js
const world = 'world';

`hello world`;

`
hello world
`

`hello ${world}`
  ```

  模板字符串中嵌入变量，需要将变量名写在${}之中。大括号内部可以放入任意的JavaScript表达式，可以进行运算，以及引用对象属性。


## 标签模板

模板字符串紧跟在一个函数名后面，该函数将被调用来处理这个模板字符串。常被用来过滤 HTML 字符串，防止恶意内容。另一个应用，就是多语言转换（国际化）。

## 正则表达式

  u 修饰符，含义为 unicode 模式，用来正确处理四个字节的UTF-16编码。

  ```js
/^\uD83D/u.test('\uD83D\uDC2A'); // false
/^\uD83D/.test('\uD83D\uDC2A'); // true
/^.$/u.test('我'); // true, . 也能匹配中文（两个字符）了
  ```

  y 修饰符，也叫『粘连』(sticky)修饰符。

  y修饰符的作用与g修饰符类似，也是全局匹配，后一次匹配都从上一次匹配成功的下一个位置开始。不同之处在于，g修饰符只要剩余位置中存在匹配就可，而y修饰符确保匹配必须从剩余的第一个位置开始，这也就是“粘连”的涵义。

  ```js
var str = 'aaa_aa_a';
var re = /a+/y;
re.exec(str); // ["aaa"]
re.exec(str); // null
  ```

  目前，y、u 修饰符都还不支持

## 数值扩展

  进制    | 前缀
  --------|----
  二进制   |  0b
  八进制   |  0o
  十六进制 |  0x

  Number(0x15) 转换成十进制，非数字转换为数值

  Number.isFinite 判断非无穷

  Number.isNaN 判断非数值

  Number.parseInt 转整数

  Number.parseFloat 转浮点数

  Number.isInteger 判断是否是整数

  window.isFinite 对参数先调用 Number()

  window.isNaN

  Math.trunc 返回数值的整数部分

  Math.sign 判断数值是正数、负数、还是零，结果： 1、-1、0、-0、NaN


## Iterator（遍历器）

  提供统一的访问机制遍历数据集合的成员。供 for...of 使用。

  map|set|array

    .keys()：返回一个键名的遍历器

    .values()：返回一个键值的遍历器

    .entries()：返回一个键值对的遍历器

  ```js
for(let [index, value] of [1, 2, 3].entries()) {
  index; // 0, 1, 2
  value; // 1, 2, 3
}
  ```

## 数组扩展

  Array.from 将类似数组的对象和可遍历的对象转换成真正的数组

  Array.of 将一组值转换为数组

  array.copyWithin(target, start, end) 将 start 位到 end 前一位复制到 target 位开始的位置

  ```js
[1, 2, 3, 4, 5].copyWithin(0, 2, -1);
// [3, 4, 3, 4, 5]
  ```

  array.find((item)=>{return true}) 遍历数组，找出第一个符合条件（回调函数返回 true）的值，将该值返回

  array.findIndex 同上，返回该值的位置，找不到符合条件的返回 -1

  array.fill(value, start, end) 往原数组的 start 位置到 end 前一个位置填充 value

## 函数扩展

  参数默认值。参数值为 undefined 时，赋予默认值。在尾参数上定义默认值，否则该参数是没法省略的。

  指定了默认值以后，函数的length属性，将返回没有指定默认值的参数个数。

  可用于指定某一参数不能被省略，或表明这个参数可以省略

  ```js
function throwMissing() {
  throw new Error('missing');
}

function f(a=throwMissing(), b=2, c=3) {
}
f(1); // a=1, b=2, c=3
f(1, undefined, 4); // a=1, b=2, c=4
f.length; // 0
  ```

  rest 参数。获取函数多余的参数。ES6 严格模式不能使用 arguments。

  ```js
function f(head, ...arg) {}
f(1, 2, 3); //head=1, arg=[2, 3]
  ```

  扩展运算符（...arrayName）。将数组转换为逗号分隔的参数序列。主要用于函数调用。

  应用：

  1. 代替apply

  2. 合并数组

  3. 与解构赋值组合生成数组

  4. 得到正确的字符串长度

  5. 将实现了Iterator接口的对象转换成数组


  ```js
function push(array, ...items) {
  array.push(...items); // [1, 2, 3]
  array.push.apply(array, items); // bad case
}
push([], 1, 2, 3);

[1, 2, 3, ...[4, 5]]; // [1, 2, 3, 4, 5]

let [a, ...rest] = [1, 2, 3, 4]; //a=1, rest=[2, 3, 4]

let str = '我shi';
[...str].length; // 5
  ```

  箭头函数 ()=>{} 语法糖


## 对象扩展

  Object.is 同值相等，基本与 === 一致，但是 +0 不等于 -0， NaN 等于 NaN

  Object.assign(target, source, source2) 将 source、source2 对象的自身属性复制到 target 对象，不可枚举属性和继承的属性不被拷贝。对于嵌套的对象，此方法执行的是替换，而非添加。应用：

    - 为对象添加属性和方法

    - 克隆对象

    - 合并对象

    - 为对象属性指定默认值

## Set 和 WeakSet

  它类似于数组，但是成员的值都是唯一的，没有重复的值。WeakSet 的成员只能是对象。

  ```js
  new Set([1, 2, 2, 3, 4, 4])
  ```

  set.size set成员个数

  set.add 添加成员

  set.delete 删除成员

  set.has 检查是否拥有某值

  set.clear 清空set

## Map 和 WeakMap

  类似于 Object，但是 Map 的键不局限于字符串。WeakMap 的键只能是对象，NaN 除外。

  map.size 成员个数

  map.set(key, value) 添加成员

  map.get(key) 返回指定 key 的成员的值，找不到则返回 undefined

  map.has 检查数据中是否含有某值

  map.delete 删除指定键值成员，成功返回 true，失败返回 false

  map.clear 清空map

## WeakSet 和 WeakMap

  没有 size 属性，没有遍历操作，无法清空。

  典型应用是，一个对应DOM元素的WeakMap结构，当某个DOM元素被清除，其所对应的WeakMap记录就会自动被移除。基本上，WeakMap的专用场合就是，它的键所对应的对象，可能会在将来消失。WeakMap结构有助于防止内存泄漏。

  ```js
var wm = new WeakMap();
var element = document.querySelector(".element");

wm.set(element, "Original");
wm.get(element) // "Original"

element.parentNode.removeChild(element);
element = null;
wm.get(element) // undefined
  ```

## Generator 函数

  ```js
function* f() {
  yield '1';
  console.log(1);
  yield '2';
  console.log(2);
}
var it = f();
it.next(); // 执行 yield '1'，等到 next 命令再向下执行
it.next(); // 1
it.next(); // 2
  ```

  形式上，function 与方法名中间有（*）号，函数内部用 yield（产出），定义不同内部状态。yield 只能出现在 generator 函数中。

  执行 generator 函数会返回一个遍历器，不断的执行 next，遍历函数的每一个状态。

  yield 语句本身没有返回值，通过在 next 带上一个参数，设置上一个 yield 的返回值。

  ```js
function* f(x=1) {
  var y = yield (x + 1);
  var z = yield (x + y);
  return x + y + z;
}
var it = f();
it.next(); // x=1, y=undefined, z=undefined
it.next(4); // x=1, y=4, z=undefined
it.next(10); // x=1, y=4, z=10
  ```

  for ... of ... 可代替 next

## Promise

  一个对象，用来传递异步操作的消息。它代表了某个未来才会知道结果的事件（通常是一个异步操作），并且这个事件提供统一的API，可供进一步处理。

  ```js
var p = new Promise(function(resolve, reject) {
  setTimeout(function() {
    resolve('a');
  }, 2000);
});
p.then(function(result) {
  console.log(result);
});
// 2秒后输出 a
  ```

  promise.then 为 promise 实例添加状态改变时的回调函数，第一个参数为 resolved 的回调，第二个参数是 rejected 的回调

  promise.catch 指定发生错误时的回调函数

  Promise.race 将多个 promise 实例包装成一个新实例，只要一个实例的状态改变了，新实例的状态就跟着改变了，传递给回调函数的值为率性改变状态示例的返回值

  Promise.all 将多个 Promise 实例包装秤一个新实例，所有的实例状态改变了，新实例的状态才会改变，新实例的状态由各个实例的最终状态执行『且』运算得到，传递给回调函数的值为每个实例结果组成的数组

  Promise.resolve 返回一个状态为 resolved 的实例

  Promise.reject 返回一个状态为 rejected 的实例

## Class

  ECMAScript 5 构造函数的语法糖。

  ```js
class A {
  constructor() {
    this.a = 'a';
  }
  sayIt() {
    alert(this.a);
  }
}
// ES 5
function A() {
  this.a = 'a';
}
A.prototype.sayIt = function() {
  alert(this.a);
};
  ```

  Class 继承

  ```js
class B extends A {
  constructor() {
    super();
    this.a = 'b';
  }
  sayIt() {
    super.sayIt();
  }
}
var b = new B();
b.sayIt();
  ```
  super关键字指向父类

  static 关键字，表示该方法不会被实例继承，而是直接通过类来调用，被称为静态方法。静态方法会被继承。

  ```js
class A() {
  constructor() {}
  static sayHi() {
    console.log('hi');
  }
}
A.sayHi();
  ```
  静态属性。class 内部只有静态方法，没有静态属性。
  ```js
class A() {}
A.hi = 'hi';
  ```

## 模块

  通过export命令显式指定输出的代码，输入时采用import静态命令

  ### export 命令
  ```js
// jackson.js
export var firstName = 'Michael';
export var lastName = 'Jackson';
export var year = 1958;
  ```
  ```js
var firstName = 'Michael';
var lastName = 'Jackson';
var year = 1958;
export {firstName, lastName, year};
  ```

  as 重命名对外接口名称
  ```js
var firstName = 'Michael';
var lastName = 'Jackson';
var year = 1958;
export {firstName as fn, lastName as ln, year as y};
  ```

  export default 为模块指定默认输出
  ```js
// jackson2.js
export default {firstName: 'Mickael', lastName: 'Jackson', year: 1958};
  ```

  ### import 命令

  引入具体的值
  ```js
  import {firstName, lastName, year} from './jackson';
  ```

  全部引入
  ```js
  import * as jackson from './jackson';
  ```

  引入使用 export default 的模块
  ```js
  import jackson from './jackson2';
  ```
