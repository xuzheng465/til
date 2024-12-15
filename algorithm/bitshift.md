# 位运算

## 左移操作

$1 \ll j$ = $2^j$

- 计算 2 的 j 次方：$1 \ll j \equiv 2^j$
- 创建掩码：$(num \& (1 \ll j)) \neq 0$
- 设置第 j 位为 1：$num |= (1 \ll j)$

## 右移操作

$j \gg 1$ = $\lfloor \frac{j}{2} \rfloor$

- 二分查找中点：$mid = (left + right) \gg 1$

## 左移 1 位

$j \ll 1$ = $j \times 2$

- 树的左子节点：$leftChild = parent \ll 1$
- 树的右子节点：$rightChild = (parent \ll 1) + 1$

## 常见组合公式

- 判断第 k 位：$(n \& (1 \ll k)) \neq 0$
- 设置第 k 位：$n |= (1 \ll k)$
- 清除第 k 位：$n \&= \sim(1 \ll k)$
- 切换第 k 位：$n \wedge= (1 \ll k)$
