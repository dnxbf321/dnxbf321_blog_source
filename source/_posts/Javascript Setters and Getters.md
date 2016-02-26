title: "Javascript Getters and Setters"
date: 2016-02-24 15:15:28
layout: post
categories:
- 前端
tags:
- 前端
- Javascript
---

Getters 和 setters 是用来读取和设置数据非常好的方式。比方说，你需要从一个对象中读取和设置一个值，如下代码：

```js
function Field(val){
  var a = val;

  this.getValue = function(){
    return a;
  };

  this.setValue = function(val){
    a = val;
  };
}
var field = new Field("test");
field.value
// => undefined
field.setValue("test2")
field.getValue()
// => "test2"
```

我们可以使用到 getters 和 setters 来重写，重写的代码如下：

```js
function Field(val){
  this.a = val;
}

Field.prototype = {
  get value() {
    return this.a;
  },
  set value(val) {
    this.a = val;
  }
};
var field = new Field("test");
field.value
// => "test"
field.value = "test2";
// => "test2"
```

可以看到，读取值和设置值都是如此简明。get、set 关键字后面的方法分别实现了对 this.a 的读取和设置。获取时 .value 即可，不加括号。设置时，使用 =，= 右边是要设置的值。

使用 getters、setters，让代码更加清晰，明确哪些值是可读的，哪些是可写的。

目前，chrome、safari、firfox、ie>=9 之后都是支持的。
