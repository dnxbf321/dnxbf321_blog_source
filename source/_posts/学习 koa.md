title: "学习 koa"
date: 2016-02-24 14:14:25
layout: post
categories:
- 前端
tags:
- 前端
- Node
- Javascript
---

## 背景
最近项目中首次使用 node 作为前端后台，便于同步渲染模板。项目中，少不了需要选择一个框架来充当骨架。对，我们选择的当红炸子鸡『koa』。


## 基本用法
```js
// 引入 koa
import koa from 'koa';

// 实例化 koa
let app = new koa();

// 请求返回 hello world
app.use(function *(){
  this.body = 'Hello World';
});

// 启动服务器，监听端口 3000
app.listen(3000);
```
注意，我们使用了 es6 的语法，为了让 node 可以顺利运行，需要先引用 babel/register 。

概括起来，分三步走：
1. 引入并实例化 koa
2. 往 koa 中插入中间件，如 koa-router、koa-static 中间件
3. 启动服务

## 看源码

以下是 koa/lib/Application.js 部分代码
```js
...

var app = Application.prototype;
function Application() {
  ...
};
Object.setPrototypeOf(Application.prototype, Emitter.prototype);
app.listen = function() {
  ...
};
app.use = function() {
  ...
};
app.callback = function() {
  ...
};
app.createContext = function() {
  ...
};
app.onerror = function() {
  ...
}
```
看到没有，代码毫无花哨可言，这不就是个普通的构造函数嘛！

下面我们逐个展开看代码

先上 Application function
```js
function Application() {
  // 检查作用域 this，兼容 new koa() 和 koa() 两种调用方式。这行完全可以删掉，强烈建议程序员使用 new koa() 这种形式
  if (!(this instanceof Application)) return new Application;
  // 添加 env 对象到 this
  this.env = process.env.NODE_ENV || 'development';
  // 添加 subdomainOffset 到 this
  this.subdomainOffset = 2;
  // 初始化 middleware
  this.middleware = [];
  // 将 context 对象添加到 this
  this.context = Object.create(context); // context = require('./context')
  // 将 request 对象添加到 this
  this.request = Object.create(request); // request = require('./request');
  // 将 response 对象添加到 this
  this.response = Object.create(response); // response = require('./response');
}
```

```js
// Application.prototype = Emitter.prototype
Object.setPrototypeOf(Application.prototype, Emitter.prototype); // Emitter = require('events').EventEmitter
```

再看 app.use
```js
/**
 * 添加中间件
 */
app.use = function(fn){
  // 检查 fn 是否是 generator 函数，非将出现错误
  if (!this.experimental) {
    assert(fn && 'GeneratorFunction' == fn.constructor.name, 'app.use() requires a generator function');
  }
  debug('use %s', fn._name || fn.name || '-');
  // 将 fn 中间件保存到 middleware 数组中
  this.middleware.push(fn);
  return this;
};
```

再看 app.callback
```js
/**
 * 返回服务启动的回调方法
 */
app.callback = function() {
  // 且将 this.experimental 定义为 false，只看右边分支
  // compose = require('koa-compose')
  // compose 将 middleware 数组元素，包装成一个 generator 函数
  // co.wrap 将 generator 函数包装秤一个 promise 函数
  var fn = this.experimental
    ? compose_es7(this.middleware)
    : co.wrap(compose(this.middleware));
  var self = this;

  if (!this.listeners('error').length) this.on('error', this.onerror);

  // 返回函数
  return function(req, res){
    res.statusCode = 404;
    // 创建作用域
    var ctx = self.createContext(req, res);
    // 监听 response，完成时执行回调 app.onerror 方法，将错误打印出来
    onFinished(res, ctx.onerror);
    // 执行 fn，promise 状态为 resolve 时响应请求，将结果返回给请求方
    fn.call(ctx).then(function () {
      respond.call(ctx);
    }).catch(ctx.onerror);
  }
}
```

再看 app.listen
```js
app.listen = function(){
  debug('listen');
  // 创建 sever
  var server = http.createServer(this.callback());
  // 将 server 开始监听工作
  return server.listen.apply(server, arguments);
};
```

再看 app.createContext
```js
/**
 * 对 this.context 进行扩展，生成新的 context，作为中间件的作用域
 */
app.createContext = function(req, res){
  var context = Object.create(this.context);
  var request = context.request = Object.create(this.request);
  var response = context.response = Object.create(this.response);
  context.app = request.app = response.app = this;
  context.req = request.req = response.req = req;
  context.res = request.res = response.res = res;
  request.ctx = response.ctx = context;
  request.response = response;
  response.request = request;
  context.onerror = context.onerror.bind(context);
  context.originalUrl = request.originalUrl = req.url;
  context.cookies = new Cookies(req, res, this.keys);
  context.accept = request.accept = accepts(req);
  context.state = {};
  return context;
};
```

至此，Application.js 分析完毕。

再移步到 context.js。context.js 中初始化了 context 的所有方法。

再移步到 response.js、request.js，这两个 js 是对 context.response、context.request 方法的实现。

over!!!
