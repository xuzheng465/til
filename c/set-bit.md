# 将 x 中的位设置为 y 的值

- 一个 32 位的数 x = 0x1234ABCD
- 想在位置 shift = 8 处
- 设置一个 4 位的字段
- 新值 y = 0x5

- 假设 mask = 0x00000F00 （4 位 mask 在位置 8）
- ~mask = 0xFFFFF0FF （取反后的 mask）
- x & ~mask = 0x1234A0CD （清除 mask 位）

```shell
x        = 0x1234ABCD
~mask    = 0xFFFFF0FF
结果      = 0x1234A0CD （清除了位置8-11的位）
```

- y << shift = 0x00000500 （将 y 移动到位置 8）
