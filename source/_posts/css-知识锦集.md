title: "css 知识锦集"
date: 2015-03-31 18:56:15
layout: post
categories:
- 前端
tags:
- CSS
- 前端
---
# css 知识

### calc()

css 数学运算

### 弹性盒模型

display: flex 新

display: box 旧

### 元素上下居中

- css3: 弹性盒模型

- css3: translate
```
  .element{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
```

- 模拟 table
```
  .elementParentParent {
    display: table;
    .parent {
      display: table-row;
      .element {
        display: table-cell;
        vertical-align: middle;
      }
    }
  }
```

- 事先知道元素高度：
```
  .element{
    position: absolute;
    top: 50%;
    height: 100px;
    margin-top: -50px; // 一半元素高度
  }
```


### 绝对定位元素的上下左右居中
```
  .element {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 200px;
    height: 300px;
    margin: auto;
  }
```
适用于知晓宽高数值的情形。

### css 创建三角形

使用 border 设置各边的 width 及颜色（配合上 transparent ）可创建直角三角形。

### 两边对齐

常见的左中右三元素第一个左对齐，第二个居中对齐，最后一个靠右对齐，css3 使用伸缩布局（ display: flex ）配合 justify-content: space-between 便可实现，再也不需要设置 float 和 text-align 那么麻烦的做法。

### 模糊阴影

设置背景（rgba），.element::after 设置为底层作为背景，背景使用 blur 滤镜

### data/image

请避免使用 
- 增加文件体积，浏览器会阻塞加载 css 文件，之后才渲染网页，保持css 文件的小巧能让用户更快的看到网页，让用户等待超过 3 秒，你将会失去他 
- 渲染占 cpu，特别是在移动端
- 不能缓存，每次渲染都需要重新解析渲染，耗资源 
- 不语义化，不知道这张图片是什么，没有命名，不语义

### placeholder 样式
- webkit 使用伪元素 ::-webKit-input-placeholder
- firefox 使用伪元素 ::-moz-placeholder
- IE10+ 使用伪类 :-ms-input-placeholder

### 伪类和伪元素怎么区分

他们是否产生了新的元素（抽象），例子： 
- ::first-line如果没有伪类伪元素，需要在第一行加标签如 span，这时，css 中它就是伪元素，伪元素用两个冒号 
- :first-child 如果没有伪类伪元素，为了实现效果，也只需在第一个元素多加一个 class 即可解决，换句话说不用另外添加标签即可实现效果，这时，它就是伪类，伪类用一个冒号

### 图片适配 retina 屏
使用 image-set
```
  background-image: image-set(url(/image@1x.png) 1x, url(/image@2x.png) 2x)
```

### :nth-child 和 :nth-of-type
- e:nth-child 匹配的是父元素的第 n 个子元素 e
- e:nth-of-type 匹配同类型中的第 n 个同级兄弟元素 e

### transform 闪烁

闪烁归根结底是帧率不足，可通过开启硬件加速解决，使用
```
  transform: transform3d(0, 0, 0);
  transform-style: preserve-3d
```
如若还是没解决，这肯定是其他地方出了问题，极大可能是你没设置 tap-highlight-color: rgba(255, 255, 255, 0)

### 禁止 iOS 下旋转屏幕字体大小变化

通过 css 设置元素的 text-size-adjust: none 即可禁止字体变大变小。
设置了 font-size 具体值（ px 单位）的字体不受旋转影响。

### hover 显示边框

使用 outline 而不是 border

### aspect-ratio

css 媒体查询 aspect-ratio 定义的屏幕可视区的高宽比，设置是必须是 1/1 的形式，不允许出现小数，必须有斜杠。可以用这个检查手机的横竖状态。

### box-shadow 和 filter: drop-shadow

前者的的阴影是矩形，而后者是真真正正的包裹整个元素周围，尽管是不规则多边形。

### css transition

简写时推荐写法 all .2s ease 1s，注意，两个时间，出现在前面的动画过渡时间，第二个时间为开始动画前等待的时间，当只有一个时间时，它只能是动画过渡时间。

### css3 background

background: #fff url(/path.png) left center/200px 100px no-repeat scroll content-box padding-box，注意，background-size可以只设置宽，图片自动等比例缩放。

### background-position 可根据边距偏移

例如 background-position: right 10px bottom 5px 表示参照点为右下角，向左偏移 10 像素，向上偏移 5 像素。

### 关闭拼写检查

常看见mobile browser在输入时会在你的单词底划上个红色虚线，很不顺眼有木有，通过设置 input/textarea 的 spellcheck="false" 即可搞定

### 如何写好输入框

- 在书写输入框的时候，如果要增加光标高度，那么最可行的做法是增加文字的大小

- 始终设置输入框高度，始终设置行高为 1，不使用 padding-top、padding-bottom

### input date pickers

iOS 8.1 支持 type 类型有 date、time、month，不支持 week、datetime、datetime-local

### 网页端支持emoji

使用iconfont：http://emojisymbols.com/

### 段落 underline
```
p {
  line-height: 25px;
  background-image: linear-gradient(to bottom, #fff 24px, #ccc 24px, rgba(0,0,0,0.5) 25px);
  background-repeat: repeat-y;
  background-size: 100% 25px;
}
```
效果如图：

### webapp 和 rem

设置 document 根元素的 font-size，其他元素的宽高使用 rem 单位进行布局。

以 320px 屏幕宽度为标准宽度举例：
``` js
  (function(doc, win) {
    'use strict';
    var docEl = doc.documentElement,
      resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
      recalc = function() {
        var clientWidth = docEl.clientWidth;
        if (!clientWidth) {return;}
        docEl.style.fontSize = 16 * (clientWidth / 320) + 'px';
      };

    if (!doc.addEventListener) {return;}
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
  })(document, window);
```

### border-radius

「/」（斜杠）标签
```
  border-raduis: 35px 25px 30px 20px / 25px 35px 20px 20px;
```
「/」前定义 x 轴半径，「/」后定义 y 轴半径。


### table-layout

- fixed 表格只计算第一行的宽度便可渲染，之后行的宽度依第一行的进行排版。
- auto 表格需要分析整个单元格的内容之后才能确定列宽。
