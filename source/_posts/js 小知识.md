title: "javascript 小知识"
date: 2015-04-01
layout: post
categories:
- 前端
tags:
- Javascript
- 前端
---

### javascript 永远是先解析声明函数，再解析变量

### 静态文件加载状态
通过 onreadystatechange 监听，node.readyState 为 loaded 或者 complete 时，加载完成。

### 探测功能、特性、对象属性
相对于使用 navigator.geolocation 探测功能特性或对象属性，使用 "geolocation" in navigator 更高效，前者可能会在某些浏览器下导致内存泄漏，如果这个属性值是假，那么前者探测方式将会得到一个“否”的结果，并不能真正探测出这个键名是否存在。

### document.URL
document.URL == location.href，但是 document.URL 是只读的

### scrollTop
- quirks mode: document.body.scrollTop
- strict mode: document.documentElement.scrollTop
- ie：window.pageYOffset
- 其他：window.scrollY

### querySelectorAll return NodeList

### NodeList
不是数组，和 arguments 对象类似，要使用数组的方法，可以用
```js
  Array.prototype.forEach.call(myNodeList, function() {
    // do something with nodeItem
  });
```

### array concat 和 push 互用
```js
[1, 2].concat([3, 4]);
[1, 2].push(3, 4);
```

### style.cssText 批量设置行内样式

### classList API
```js
divNode.classList.add('className');
divNode.remove('className');
divNode.toggle('className');
```

### focus、blur 事件可以用捕获而不是冒泡的办法获得。

### 全能判断一个变量的类型：
```js
Object.prototype.toString.call(myVar)
// [object Function/Object/String/Array/Boolean/Number]
```
### jQuery ajax
发送请求时，当 dataType 为 json 时，jQuery 会在检查返回的字符串是否符合 json 格式（即使不用返回时也需要返回{}），并调用JSON.parse 方法再执行回调函数，否者回调函数不会执行并抛出 error 错误，执行 error 回调函数。

### html5 新标签 <template>
- 顾名思义为模版，它具有天然的标签内容隐藏的特点，即使你设置 display 为 block 也无济于事。

- 它可出现在任意位置，类似与script和style标签。

- childNodes 无效性，可使用 template.innerHTML 获取完整的 html 片段，若非得获取“伪子元素”，使用 template.content，返回一个文档片段，可以理解为另一个 document。

- 支持 chrome ios8 android4.4 以上版本浏览器。

类似 template，还有 link rel="import"，js 里的 registerElement、createShadowRoot，详见：<http://www.ifeenan.com/~posts/JavaScript/2014-06-07-%E8%AF%B4%E8%AF%B4%20Web%20Components.md>

### dns-prefetch 加速 DNS 解析速度
详见 <https://developer.mozilla.org/zh-CN/docs/Controlling_DNS_prefetching>

### input pattern
```html
<input type="email" pattern="[^ @]*@[^ @]*" value="">
```
用户输入一个有效的 email 或 URL 地址，pattern 属性可以令你直接使用 regular expressions 而无需检查 JS 或服务器端代码。

### iOS safari 访问 camera

对应的 html5 表单：
```html
<input type="file" accept="image/*" capture="camera" id="capture">
```
API参考 HTML Media Capture：<http://www.w3.org/TR/2011/WD-html-media-capture-20110414/>

### FormData

对象可快速获取 form 表单值，类似与 jQuery 的 serialize 方法，还可以利用其实现二进制文件的异步上传。详见：<https://developer.mozilla.org/zh-CN/docs/Web/Guide/Using_FormData_Objects>。使用 jQuery Ajax 时，需将 contentType 设置为 false，processData 也设置为 false 。

### FileReader
使用FileReader对象, web应用程序可以异步的读取存储在用户计算机上的文件(或者原始数据缓冲)内容，可用在图片预览等场景。

### pushState
可改变地址栏但是不刷新页面，配合 Ajax 可良好的用于单页面应用。注意，pushState 并不会触发 popstate ，页面加载也不会触发 popstate，当history.go或者浏览器前进后退按钮被摁下时触发 popstate 。

### window.event
ie下的对象，只存在于事件发生时。如果事件处理有setTimeout，延时里是索引不到 window.event 的。

### new RegExp创建正则需要双重转义。

### 服务器端数据推送技术
- WebSocket。WebSocket 规范是 HTML 5 中的一个重要组成部分，已经被很多主流浏览器所支持。不过 WebSocket 技术也比较复杂，包括服务器端和浏览器端的实现都不同于一般的 Web 应用。

- 简易轮询。基于 HTTP 协议来达到实时推送的效果。

- COMET 技术。改进了简易轮询的缺点，使用的是长轮询。长轮询的方式在每次请求时，服务器端会保持该连接在一段时间内处于打开状态，而不是在响应完成之后就立即关闭。COMET 技术并不是 HTML 5 标准的一部分，从兼容标准的角度出发，也不推荐使用。

- 服务器数据推送。不WebSocket 规范更加复杂一些，适用于需要进行复杂双向数据通讯的场景。对于简单的服务器数据推送的场景，使用服务器推送事件就足够了。

### Promise
使用 Promise 改善异步流程

### 数组拷贝
array.slice()

### 对象拷贝
$.extend({}, object)

### getAllResponseHeaders
获取异步响应头