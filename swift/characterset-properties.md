CharacterSet Properties

以下是 CharacterSet 中一些常用的预定义属性：

- alphanumerics：包含字母和数字的字符集。
- letters：包含所有字母的字符集，包括大写和小写。
- lowercaseLetters：包含所有小写字母的字符集。
- uppercaseLetters：包含所有大写字母的字符集。
- decimalDigits：包含所有十进制数字的字符集。
- whitespaces：包含所有空白字符的字符集。
- newlines：包含所有换行符的字符集。
- punctuationCharacters：包含所有标点符号的字符集。
- symbols：包含各种符号的字符集。

CharacterSet 的 inverted 属性返回当前字符集的反向集合。例如，letters.inverted 包含了所有不是字母的字符。

```swift
let letters = CharacterSet.letters
let invertedLetters = letters.inverted
print(invertedLetters) // 输出 CharacterSet with 65533 elements which is not letters
```
