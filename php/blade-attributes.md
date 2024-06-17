如果你在使用 Blade 组件时，还想传递额外的 `class` 属性，你可以使用 `{{ $attributes->merge() }}` 方法来合并这些类。这在组件内预定义了一些类的基础上，可以添加或覆盖新的类。

下面是一个示例，展示如何在传递额外的 `class` 属性时进行合并。

### 定义组件

首先，定义你的 Blade 组件，假设文件名为 `button.blade.php`：

```blade
<!-- resources/views/components/button.blade.php -->
<a class="{{ $active ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white' }} rounded-md px-3 py-2 text-sm font-medium {{ $attributes->get('class') }}"
   aria-current="{{ $active ? 'page' : 'false' }}"
   {{ $attributes->except('class') }}
>
    {{ $slot }}
</a>
```

在上面的代码中：

- `{{ $attributes->get('class') }}` 用于获取传递给组件的 `class` 属性，并将其合并到预定义的类中。
- `{{ $attributes->except('class') }}` 用于排除 `class` 属性，因为我们已经在手动处理它。

### 使用组件

在使用组件时，你可以传递额外的 `class` 属性：

```blade
<!-- 使用该组件 -->
<x-button href="/home" id="home-link" data-toggle="tooltip" title="Go to home page" class="additional-class another-class">
    Home
</x-button>
```

### 生成的 HTML

最终生成的 HTML 会是：

```html
<a
  class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium additional-class another-class"
  aria-current="false"
  href="/home"
  id="home-link"
  data-toggle="tooltip"
  title="Go to home page"
>
  Home
</a>
```

### 使用 `merge` 方法的另一种方式

你也可以在组件中使用 `merge` 方法来处理类的合并，更加灵活和直观：

```blade
<!-- resources/views/components/button.blade.php -->
<a {{ $attributes->merge(['class' => ($active ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white') . ' rounded-md px-3 py-2 text-sm font-medium']) }}
   aria-current="{{ $active ? 'page' : 'false' }}"
>
    {{ $slot }}
</a>
```

在这个版本中：

- 点号 (.) 用于字符串连接。

- `{{ $attributes->merge(['class' => ...]) }}` 会自动处理类的合并，无需手动排除 `class` 属性。

### 使用组件

同样地，你可以传递额外的 `class` 属性：

```blade
<!-- 使用该组件 -->
<x-button href="/home" id="home-link" data-toggle="tooltip" title="Go to home page" class="additional-class another-class">
    Home
</x-button>
```

### 生成的 HTML

最终生成的 HTML 同样会合并所有的类：

```html
<a
  class="bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium additional-class another-class"
  aria-current="page"
  href="/home"
  id="home-link"
  data-toggle="tooltip"
  title="Go to home page"
>
  Home
</a>
```

通过这些方法，你可以确保在组件中预定义的类与传递的类属性正确地合并，从而实现更灵活和可复用的组件设计。
