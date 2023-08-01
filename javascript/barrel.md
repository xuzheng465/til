# Barrel

barrel 就是将多个文件模块的 export，汇总到一个文件当中。比如有三个文件，每个文件都有一个导出。

```js
// demo/foo.ts
export class Foo {}

// demo/bar.ts
export class Bar {}

// demo/baz.ts
export class Baz {}
```

如果不用 barrel 的话，就要这样导入

```js
import { Foo } from '../demo/foo'
import { Bar } from '../demo/bar'
import { Baz } from '../demo/baz'
```

如果使用 barrel 的话，就在 demo 中创建一个 `index.ts` 这个 index.ts 就是 barrel

```typescript
// demo/index.ts
export * from './foo'
export * from './bar'
export * from './baz'
```

在导入的时候可以这样做。

```ts
import { Foo, Bar, Baz } from '../demo' // demo/index.ts is implied
```

除了 export `*`, 你还可以选择导出模块名。

```js
// demo/foo.ts
export class Foo {}

// demo/bar.ts
export class Bar {}

// demo/baz.ts
export function getBaz() {}
export function setBaz() {}
```

如果不想直接导出函数名，因为直接导出函数名可能会污染 namespace， 可以这样做

```ts
// demo/index.ts
export * from './foo' // re-export all of its exports
export * from './bar' // re-export all of its exports

import * as baz from './baz' // import as a name
export { baz } // export the name
```

在使用这些导出时

```ts
import { Foo, Bar, baz } from '../demo' // demo/index.ts is implied

// usage
baz.getBaz()
baz.setBaz()
// etc. ...
```
