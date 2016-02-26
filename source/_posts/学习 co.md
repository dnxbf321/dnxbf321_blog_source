title: "学习 co"
date: 2016-02-23 10:29:15
layout: post
categories:
- 前端
tags:
- 前端
- Node
- Javascript
---

co 是使用 ES6 generator 的必然会引用到的第三方库，它很好的解决了 yield 表达式返回值的问题，通过自动的不断调用 .next 使得函数向下执行。

```js
var co = require('co');

function * yieldFunc() {
  var i = 0;
  var a = yield ++i;
  var a2 = yield ++i;
  return {
    1: a,
    2: a2
  };
}

co(function*() {
  var ret = yield yieldFunc();
  return ret;
}).then(function(ret) {
  console.log(ret);
});
```

上面是一个 co 的使用范例。它接受一个 generator 函数作为参数，返回一个 Promise 对象，将 generator 函数的执行结果作为 resolve 的参数，通过调用 then 方法，将结果打印到控制台。

co 的源码很短，不过 200 来行（注释计算在内了），如果我们只按照上面的例子调用 co，co 可以简化为如下代码

```js
module.exports = simpleCo;
function simpleCo(gen) {
  var ctx = this;
  return new Promise(function(resolve, reject) {
    gen = gen.call(ctx);
    fulNext();
    function fulNext(res) {
      try {
        var ret = gen.next(res);
        if (!ret.done) {
          fulNext(ret.value);
        } else {
          resolve(ret.value);
        }
      } catch ( e ) {
        reject(e);
      }
    }
  });
}
```
20 行足矣，源码见 [github](https://github.com/dnxbf321/simple-co)。
