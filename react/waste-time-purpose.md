# How to waste 500ms on purpose

```js
let startTime = performance.now()
while (performance.now() - startTime < 500) {
  // Do nothing for 500 ms to emulate extremely slow code
}
```
