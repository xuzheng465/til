# How to get Character's ascii value

```swift
let char: Character = "a"
// 不加 ! 的话是一个 optional
let ascii = char.asciiValue!
print(ascii) // 97
```

## Convert ascii to Character

```swift
let ascii: UInt8 = 97
let char = Character(UnicodeScalar(ascii))
print(char) // a
```

## Convert string to ascii

```swift
let str = "abc"
let ascii = str.compactMap { $0.asciiValue }
print(ascii) // [97, 98, 99]
```

## Convert ascii to string

```swift
let ascii = [97, 98, 99]
let str = String(ascii.compactMap { UnicodeScalar($0) })
print(str) // abc
```

## Convert string to binary

```swift
let str = "abc"
let binary = str.compactMap { $0.asciiValue }.map { String($0, radix: 2) }
print(binary) // ["1100001", "1100010", "1100011"]
```

## Convert binary to string

```swift
let binary = ["1100001", "1100010", "1100011"]
let str = binary.map { Int($0, radix: 2) }.compactMap { UnicodeScalar($0) }
print(String(str)) // abc
```

## Convert string to hex

```swift
let str = "abc"
let hex = str.compactMap { $0.asciiValue }.map { String($0, radix: 16) }
print(hex) // ["61", "62", "63"]
```
