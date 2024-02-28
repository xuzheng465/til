# Array

## create a array with 26 0s

```swift
let arr = [Int](repeating: 0, count: 26)

let arr2 = Array(repeating: 0, count: 26)
```

## create a array with 26 elements

```swift
let arr = (0..<26).map { _ in 0 }

```

## other array operations

```swift
let arr = [1, 2, 3, 4, 5]

let first = arr.first
let last = arr.last
let count = arr.count
let isEmpty = arr.isEmpty

let reversed = arr.reversed()
// reversed is a ReversedCollection<Array<Int>> type
print(reversed)
// ReversedCollection<Array<Int>>(_base: [5, 4, 3, 2, 1])


let reversedArr = Array(reversed)
print(reversedArr) // [5, 4, 3, 2, 1]

let sorted = arr.sorted()
print(sorted) // [1, 2, 3, 4, 5]

let sortedDesc = arr.sorted(by: >)
print(sortedDesc) // [5, 4, 3, 2, 1]

let sum = arr.reduce(0, +)
print(sum) // 15

let sum2 = arr.reduce(0) { $0 + $1 }
print(sum2) // 15

let sum3 = arr.reduce(0) { (result, element) in
    return result + element
}
print(sum3) // 15

// filter
let filtered = arr.filter { $0 > 2 }
print(filtered) // [3, 4, 5]

// map
let mapped = arr.map { $0 * 2 }
print(mapped) // [2, 4, 6, 8, 10]

// flatMap
let flatMapped = arr.flatMap { Array(repeating: $0, count: $0) }
print(flatMapped) // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5]

// compactMap
let compactMapped = arr.compactMap { $0 % 2 == 0 ? $0 : nil }
print(compactMapped) // [2, 4]

// forEach
arr.forEach { print($0) }

// contains
let contains = arr.contains(3)
print(contains) // true

// allSatisfy
let allSatisfy = arr.allSatisfy { $0 > 0 }
print(allSatisfy) // true

// firstIndex
let firstIndex = arr.firstIndex(of: 3)
print(firstIndex) // Optional(2)

// lastIndex
let lastIndex = arr.lastIndex(of: 3)
print(lastIndex) // Optional(2)

// dropFirst
let dropFirst = arr.dropFirst()
print(dropFirst) // [2, 3, 4, 5]

// dropLast
let dropLast = arr.dropLast()
print(dropLast) // [1, 2, 3, 4]

// prefix
let prefix = arr.prefix(2)
print(prefix) // [1, 2]

// suffix
let suffix = arr.suffix(2)
print(suffix) // [4, 5]

// split
let split = arr.split { $0 % 2 == 0 }
print(split) // [[1], [3, 5]]

// joined
let joined = arr.joined(separator: ",")
print(joined) // 1,2,3,4,5

// append
var arr2 = arr
arr2.append(6)
print(arr2) // [1, 2, 3, 4, 5, 6]
print(arr) // [1, 2, 3, 4, 5]

// insert
arr2.insert(0, at: 0)
print(arr2) // [0, 1, 2, 3, 4, 5, 6]

// remove
arr2.remove(at: 0)
print(arr2) // [1, 2, 3, 4, 5, 6]

// removeLast
arr2.removeLast()
print(arr2) // [1, 2, 3, 4, 5]

// removeFirst
arr2.removeFirst()
print(arr2) // [2, 3, 4, 5]

// removeFirst
arr2.removeFirst(2)
print(arr2) // [4, 5]

// removeSubrange
arr2.removeSubrange(0..<2)
print(arr2) // []

// replaceSubrange
arr2 = [1, 2, 3, 4, 5]
arr2.replaceSubrange(0..<2, with: [0, 0])
print(arr2) // [0, 0, 3, 4, 5]

// swapAt
arr2.swapAt(0, 2)
print(arr2) // [3, 0, 0, 4, 5]

// sort
arr2.sort()
print(arr2) // [0, 0, 3, 4, 5]

// reverse
arr2.reverse()
print(arr2) // [5, 4, 3, 0, 0]

// shuffle
arr2.shuffle()
print(arr2) // [0, 3, 5, 0, 4]

// min
let min = arr2.min()
print(min) // Optional(0)

// max
let max = arr2.max()
print(max) // Optional(5)

// first
let first = arr2.first
print(first) // Optional(0)

// last
let last = arr2.last
print(last) // Optional(4)

// randomElement
let randomElement = arr2.randomElement()
print(randomElement) // Optional(3)

// enumerated
for (index, value) in arr2.enumerated() {
    print("index: \(index), value: \(value)")
}



```

## compactMap vs flatMap

在 Swift 中，数组的 `flatMap` 和 `compactMap` 都是用于对数组进行转换和处理的方法，但它们有一些区别。

`flatMap` 方法用于将数组中的每个元素进行转换，并将转换后的结果拼接成一个新的数组。如果转换后的结果是一个序列或集合，`flatMap` 会将这些序列或集合的元素拼接在一起，形成一个新的扁平化的数组。

compactMap 方法与 `flatMap` 类似，但它专门用于处理可选值。compactMap 会对数组中的每个元素进行转换，并且会自动过滤掉转换结果为 nil 的元素，然后将非 nil 的结果拼接成一个新的数组。

```swift
let numbers = ["1", "2", "three", "four", "5"]

// 使用compactMap
let compactMapped: [Int] = numbers.compactMap { str in Int(str) }
// 结果为 [1, 2, 5]

// 使用flatMap
let flatMapped: [Int?] = numbers.flatMap { str in Int(str) }
// 结果为 [Optional(1), Optional(2), nil, nil, Optional(5)]
```

## dropLast vs removeLast

dropLast()和 removeLast()是 Swift 中用于从数组中移除最后一个元素的方法，它们之间有一些区别。

dropLast()方法会返回一个新的数组，该数组包含了移除最后一个元素后的剩余元素，但原始数组并不会被修改。这意味着 dropLast()是非破坏性的，它不会改变原始数组，而是返回一个新的数组。

```swift
var numbers = [1, 2, 3, 4, 5]
let newNumbers = numbers.dropLast()
print(newNumbers) // 输出 [1, 2, 3, 4]
print(numbers) // 输出 [1, 2, 3, 4, 5]
```

removeLast()方法会直接修改原始数组，它会移除数组中的最后一个元素，并返回被移除的元素。因此，removeLast()是破坏性的，它会改变原始数组。

```swift
var numbers = [1, 2, 3, 4, 5]
let removedNumber = numbers.removeLast()
print(removedNumber) // 输出 5
print(numbers) // 输出 [1, 2, 3, 4]
```

如果数组为空，调用 removeLast()方法会导致应用程序崩溃，因为它试图从空数组中移除元素。而 dropLast()方法则不会有这个问题，它会安全地返回一个空数组。

## sort vs sorted

`sort` 方法是一个原地排序方法，它会直接修改原始数组，使得数组中的元素按照指定的排序规则进行排序。这意味着调用 `sort` 方法后，原始数组的顺序会被改变。

```swift
var numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
numbers.sort()
print(numbers) // 输出 [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
```

`sorted` 方法是一个非破坏性排序方法，它不会修改原始数组，而是返回一个新的已排序数组。这意味着调用 `sorted` 方法后，原始数组的顺序不会改变，而是返回一个新的已排序数组。

```swift
let numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
let sortedNumbers = numbers.sorted()
print(sortedNumbers) // 输出 [1, 1, 2, 3, 3, 4, 5, 5, 5, 6, 9]
print(numbers) // 输出 [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
```
