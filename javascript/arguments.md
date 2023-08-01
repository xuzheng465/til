# What is arguments in JavaScript?

Arguments is a special variable in JavaScript. It is an array-like object that contains all the arguments passed to a function.

```js
function foo() {
  console.log(arguments)
}

foo(1, 2, 3)
```

```
// console
[object Arguments] {
  0: 1,
  1: 2,
  2: 3
}
```

## Why is it an array-like object?

Because it has a length property and you can access its elements by index.

```js
function foo() {
  console.log(arguments.length)
  console.log(arguments[0])
}

foo(1, 2, 3)
```

```
// console
3
1
```

## Why is it not an array?

Because it doesn't have all the methods that an array has.

```js
function foo() {
  console.log(arguments.map((x) => x * 2))
}

foo(1, 2, 3)
```

```
// console
TypeError: arguments.map is not a function
```

## How to convert it to an array?

```js
function foo() {
  const args = Array.prototype.slice.call(arguments)
  console.log(args.map((x) => x * 2))
}

foo(1, 2, 3)
```

```
// console
[ 2, 4, 6 ]
```

## How to convert it to an array in ES6?

```js
function foo() {
  const args = Array.from(arguments)
  console.log(args.map((x) => x * 2))
}

foo(1, 2, 3)
```

```
// console
[ 2, 4, 6 ]
```

## How to convert it to an array in ES6 with spread operator?

```js
function foo(...args) {
  console.log(args.map((x) => x * 2))
}

foo(1, 2, 3)
```

```
// console
[ 2, 4, 6 ]
```
