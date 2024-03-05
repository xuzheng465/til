# Swift 字符串过滤：保留字母和数字字符，并转为小写

第一种方法是使用 `filter` 方法，

```swift
let str = "a1b2 c3 d4"
let filtered = str.filter { $0.isLetter || $0.isNumber }
print(filtered) // a1b2c3d4
```

第二种方法是使用 `NSCharacterSet`。

```swift
let str = "a1b2 c3 d4"
let allowedCharacters = CharacterSet.alphanumerics
let filtered = str.components(separatedBy: allowedCharacters.inverted).joined().lowercased()
print(filtered) // a1b2c3d4
```

`CharacterSet` 是 Swift 中的一个结构体，用于表示一组字符。`alphanumerics` 是 `CharacterSet` 的一个预定义属性，它包含了所有字母和数字字符。

`inverted` 是 CharacterSet 的一个属性，它返回当前字符集的反向集合。在这里，allowedCharacterSet.inverted 包含了所有不是字母和数字的字符。

`components(separatedBy:)` 是一个字符串方法，它根据传入的分隔符（在这个例子中是非字母数字的字符集）将字符串分割成一个数组。由于我们使用了非字母数字字符集作为分隔符，这个操作将会移除字符串 s 中所有不属于字母或数字的字符，并返回一个包含剩余部分的数组。

数组的 `joined()` 方法将数组元素连接起来，返回一个新的字符串。在这里，它把分割后的字符串数组重新连接成一个单一的字符串

第三种方法是使用正则表达式。

```swift
let str = "a1b2 c3 D4"
let regex = try! NSRegularExpression(pattern: "[^a-zA-Z0-9]", options: .caseInsensitive)
// explain: ^ means not, a-zA-Z0-9 means letter and number
let filtered = regex.stringByReplacingMatches(in: str,
                                options: [],
                                range: NSRange(location: 0, length: str.utf16.count), withTemplate: "")
                                .lowercased()
```
