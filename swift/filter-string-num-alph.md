# Swift 字符串过滤：保留字母和数字字符

```swift
let str = "a1b2 c3 d4"
let filtered = str.filter { $0.isLetter || $0.isNumber }
print(filtered) // a1b2c3d4
```
