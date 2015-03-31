title: "css 知识锦集"
date: 2015-03-31 18:56:15
categories:
- 前端
tags:
- CSS
- 前端
---

## calc
进行数学运算，可以混合使用百分比和数值

## 元素上下居中
- 弹性盒模型 flexible box
- table
- 已知高度的元素配合使用 position margin top

## 元素两边对齐，中间的居中对齐
使用 flexible box
```css
	.parent {
	  display: flex;
	  justify-content: space-between;
	}
```

## placeholder css rules
-webkit ::-webkit-input-placeholder
firefox ::-moz-placeholder
IE10+   :-ms-input-placeholder

## 伪类和伪元素
伪类：不产生新元素节点，举例：:first-child
伪元素：产生新元素节点，举例：::after
 chrome dev tool 元素审查可看到伪元素

## nth-child 和 nth-of-type
.selector:nth-child(n) 匹配同级的第 n 个元素n 从1开始
.selector:nth-of-type(n) 比上多一个限制条件，要求兄弟的类型一致

## transform 动画闪烁
- 开启硬件加速
```css
	.selector {
	  transform: translate3d(0, 0, 0);
	  transform-style: preserve-3d;
	}
```
- care about tap-highlight-color

## 手机屏幕旋转字体大小有变
添加 rule，text-size-adjust: none。已设置 font-size 的文字不会发生这种情况。

## outline 和 border
有一种常见的场景，:hover 加边框。
before
用 border 来实现，因为标准盒模型不将 border 计算入 width、height，not hover 时也要有 border
after
outline，只需设置 hover 的状态即可

## box-shadow 和 filter: drop-shadow
box-shadow 只能生成矩形的阴影，drop-shadow 的阴影能包裹非矩形元素

## background-image for retina
background-image: image-set(url(pic@1x.png) 1x, url(pc@2x.png) 2x);

## background-position
css3
```css
	.selector{
	  background-position: right 10px bottom 5px;/* 参照点右下角 */
	}
```
很像绝对定位有木有

## 关闭 spell check
表单添加属性 spellcheck=“false”，跟恼人的红色虚线说不

## rem
[web app 变革之 rem](http://isux.tencent.com/web-app-rem.html "web app 变革之 rem")