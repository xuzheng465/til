# TypeScript Check Index Access

[source](https://twitter.com/vikingmute/status/1687016320272084992)

“当在一个数组取某个索引的值的时候，并不会检查这个索引中的项是否存在，这样有可能会出现很经典的在 undefined 上取值的问题，那么怎样告诉 tsc 获取某个索引的时候进行检查呢？“

```json
// tsconfig.json
{
  "compilerOptions": {
    "noUncheckedIndexedAccess": true
  }
}
```
