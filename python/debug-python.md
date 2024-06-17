# How to Debug Python

如何调试 Python 代码

可以选择在代码中插入断点，如下代码：

```python
import pdb
pdb.set_trace()

# or

breakpoint()
```

也可以不修改源码

```shell
python -m pdb program.py
```

pdb usage

- `w(here)` 打印当前位置的调用栈
- `l(ist)` 打印当前位置周围 11 行的代码，再次输入 l 就会下翻 11 行
- `l .` 回到当前位置
- `a(rgs)` 打印当前函数的参数
- `ll` 显示全部代码
- `u` 和 `d` 改变当前帧
- `retval` 查看函数返回值
- `util` 运行到比当前行数大的位置
- `until line_number` 直到某一行
