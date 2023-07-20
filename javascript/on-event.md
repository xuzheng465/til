# onclick vs addEventListener

一般有两种写法给html元素加上事件。一种是直接在html元素上写onclick属性，另一种是在js中用addEventListener方法。两种写法的区别是，onclick属性只能给一个元素加一个事件，而addEventListener可以给一个元素加多个事件。

禁用某个事件时，比如onmousedown，可以用下面的方法：

```js
document.getElementById("myBtn").onmousedown = function(event) {
  event.preventDefault();
};

// 也可以使用返回false
document.getElementById("myBtn").onmousedown = function(event) {
  return false;
};
```

但是如果用addEventListener方法，就不能用上面的方法了，而是要用下面的方法：

```js
document.getElementById("myBtn").addEventListener("mousedown", function(event){
  event.preventDefault();
});

// addEventListener 不能使用返回false，来达成禁用事件的目的
```