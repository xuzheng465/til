# 宏替换 `#`与`##`

## 字符串化 Stringizing

对于函数式宏，预处理器会使用宏调用时指定的实参，取代替换里表中与之对应的形参。替换列表中以 `#` 为前缀的形参会被替换为字符串字面量，其内容是对应实际参数的文本。

```c
#define STRINGIZE(x) #x
const char *str = STRINGIZE(12);

// 替换展开后
const char *str = "12";
```

## `##` token pasting

### 动态生成标识符

预处理器还会删除替换列表中所有的预处理记号 `##`, 将其前后的内容拼接在一起，这称为记号粘合 token pasting。

```c
#define CONCAT(x, y) x ## _ ## y
int CONCAT(foo, bar) = 12;
int CONCAT(myVar, 1) = 10
// 替换展开后
int foo_bar = 12;
int myVar1 = 10;
```

### 消除逗号

另外一种用法是消除逗号

```c
#define PRINTLNF(fmt, ...) printf(fmt"\n", ##__VA_ARGS__)
```

`__VA_ARGS__`是一个预处理器宏变量，用于接收宏中省略号(`...`)匹配到的所有参数。在某些情况下，当宏的可变参数部分为空时，直接使用`__VA_ARGS__`可能会导致语法错误，因为会留下一个多余的逗号。使用`##`操作符可以避免这个问题，因为当`__VA_ARGS__`为空时，`##`会去除前面的逗号，从而避免语法错误。

我不是很理解这里为什么会消除逗号，只是理解为逗号拼接空也变成空，就消掉了。

这里的`__VA_ARGS__`为空，不是指 `NULL` 或者空字符串

这样处理后这两个语句都是 valid 的

```c
PRINTLNF("Hello, world");
PRINTLNF("Value: %d", 10);
```

### 实现一种泛型宏

```c
#define DECLARE_VECTOR(type) \
    typedef struct Vector_##type { \
        type* data; \
        size_t size; \
        size_t capacity; \
    } Vector_##type;

DECLARE_VECTOR(int)
  // 展开为一个专门用于int类型的Vector_int结构体定义
```

### 实现条件编译

虽然`##`操作符本身不直接参与条件编译，但它可以用来生成根据不同条件编译的代码块中需要的标识符，从而间接实现条件编译的效果。

```c
#define PREFIX Apple
#define MAKE_FUNC_NAME(func) CONCAT(PREFIX, func)

void MAKE_FUNC_NAME(Init)() { /* ... */ }
// 展开为 void AppleInit() { /* ... */ }
```
