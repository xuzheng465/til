# Don't put your types in `.d.ts`

If you are using typescript, you might have seen `.d.ts` files. They are called declaration files. They are used to declare types for libraries that are written in javascript. For example, if you are using `lodash`, you can install `@types/lodash` to get the types for `lodash`.

However, if you are writing your own types, you should not put them in `.d.ts` files. Instead, you should put them in `.ts` files. The reason is that `.d.ts` files are not compiled. They are only used by the typescript compiler to check the types. If you put your types in `.d.ts` files, they will not be compiled into javascript. This means that you will not be able to use them in your code.

Also,

```json
// tsconfig.json
{
  "compilerOptions": {
    //...
    "skipLibCheck": true /* Skip type checking of declaration files. */
  }
}
```
