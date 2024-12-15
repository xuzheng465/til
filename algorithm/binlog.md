# 二进制位数与对数的关系

## 推导过程

设整数 $n$ 的二进制表示需要 $k$ 位，则： $2^{k-1} \leq n < 2^k$

对不等式两边取 $\log_2$： $k-1 \leq \log_2n < k$

由此可得：

$\lfloor \log_2n \rfloor = k-1$

二进制位数 $k = \lfloor \log_2n \rfloor + 1 = \lceil \log_2n \rceil$

## 实例说明

以数字 5 为例：

- 二进制表示：101（3 位）
- $2^2 < 5 < 2^3$
- $\log_2 5 \approx 2.322$
- $\lfloor \log_2 5 \rfloor = 2$
- $\lceil \log_2 5 \rceil = 3$（即二进制位数）

在 Python 中，可以通过以下方式获取 $\lceil \log_2n \rceil$：

```python
def ceil_log2(n):
  return len(bin(n)) - 2
"""
这是因为：
bin(n) 返回带 "0b" 前缀的二进制字符串
减去前缀长度2后，即为二进制位数

"""
# 还可以这么写
import math
def ceil_log2(n):
    return math.ceil(math.log2(n))
```

- 二进制位数等于 $\lceil \log_2n \rceil$
- `math.log2()` 处理大数时可能会有浮点数精度问题
- `bin()` 转换是精确的整数运算，不会有精度损失

## 应用

- [minimum query](./minquery.md)
