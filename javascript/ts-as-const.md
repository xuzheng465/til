# TypeScript `as const`

Matt Pocock's tutorial [The most underrated TypeScript feature](https://www.youtube.com/watch?v=6M9aZzm-kEc)

```ts
const routes = {
  home: '/',
  admin: '/admin',
  user: '/user',
}
```

如果这样声明，就会得到

```ts
const routes: {
  home: string
  admin: string
  user: string
}
```

如果有一个函数使用这个`routes`

```ts
const goToRoute = (route: '/' | '/admin' | '/user') => {}

goToRoute(routes.home)
// 会提示 Argument of type 'string' is not assignable to parameter of type '"/" | "/admin" | "/users"'.(2345)
```

有这个 warning 的原因是 TypeScript 无法确定 routes.home 的类型。因为 routes 对象的属性值是字符串，所以 TypeScript 会将它们推断为 string 类型。

并且他们是可变的，所以 TypeScript 会将它们推断为 string 类型。

函数 goToRoute 使用 TypeScript 中的字面量类型（Literal Types）来声明其参数 route。字面量类型是一种特定的子类型，它可以让你更具体地限制变量或参数的值。

好处：

类型安全：字面量类型提供了更强的类型安全。如果尝试传递一个不是 "/" | "/admin" | "/users" 中任何一个的值到 goToRoute 函数，TypeScript 编译器将会报错。

自动补全和错误检查：在支持 TypeScript 的 IDE（如 Visual Studio Code）中，当你开始输入参数时，IDE 会自动提示可用的选项。这可以帮助防止拼写错误或者错误的路由路径。

坏处：

不够灵活：如果你的应用程序的路由在运行时动态生成或者你希望允许任意的字符串作为路由，那么这种硬编码的方式可能就不够灵活了。

需要维护：每当你增加或删除路由时，你都需要更新 goToRoute 函数的类型声明。这可能会增加维护的复杂性。

如果在声明时添加 `as const`

```ts
const routes = {
  home: '/',
  admin: '/admin',
  user: '/user',
} as const
```

就会得到

```ts
const routes: {
  readonly home: '/'
  readonly admin: '/admin'
  readonly user: '/user'
}
```

除了 `as const` 还可以使用，`Object.freeze`，但后者只能限制第一层属性，如果属性是个 Object，它仍然能被改变。

```ts
type TypeOfRoutes = typeof routes

// hover on TypeOfRoutes shows
type TypeOfRoutes = {
  readonly home: '/'
  readonly admin: '/admin'
  readonly user: '/user'
}

type RouteKeys = keyof typeof routes
// hover
type RouteKeys = 'home' | 'admin' | 'user'

type Route = (typeof routes)[keyof typeof routes]
```

首先定义了一个名为 routes 的常量对象，它包含了三个路由路径。

然后，使用 as const 将 routes 声明为一个常量，这意味着 routes 中的值不能被改变。在 TypeScript 中，as const 被称为常量断言，它可以将变量或对象设置为只读，也可以用于推断字符串字面量类型而不是普通的字符串类型。

接着，TypeOfRoutes 是一个类型别名，它使用 typeof 关键字获取了 routes 对象的类型。所以 TypeOfRoutes 实际上就是 routes 对象的类型，即 { home: string; admin: string; user: string }。

最后，RouteKeys 也是一个类型别名，它使用 keyof 关键字获取了 routes 对象所有键的类型。所以 RouteKeys 实际上就是 routes 对象所有键的类型，即 'home' | 'admin' | 'user'。

---

`typeof routes` 得到 routes 对象的类型，即 { home: string; admin: string; user: string }。

`keyof` 操作符接受一个对象类型，并生成其键的字符串或数字字面量联合。所以 keyof typeof routes 实际上就是 routes 对象所有键的类型，即 `'home' | 'admin' | 'user'`。

`typeof routes[keyof typeof routes]` 得到 routes 对象所有键的类型，即 `'home' | 'admin' | 'user'`，然后使用索引访问操作符 [] 获取 routes 对象中的值的类型，即 `routes['home'] | routes['admin'] | routes['user']`，即 `routes['/'] | routes['/admin'] | routes['/user']`，即 `'/' | '/admin' | '/user'`。
