# how to use dictionary

## Using Default value

```swift
var dict = [Character: Int]()
dict["a", default: 0] += 1
```

## Using for-in loop

```swift
for (key, value) in dict {
    print(key, value)
}

for key in dict.keys {
    print(key)
}

for value in dict.values {
    print(value)
}
```

## Sum of values

```swift
let sum = dict.values.reduce(0, +)
```

## Remove all elements

```swift
dict.removeAll()
```

## Check if key exists

```swift
if let value = dict["a"] {
    print(value)
}
```

## Remove element

```swift
dict.removeValue(forKey: "a")
```

## Merge dictionaries

```swift
var dict1 = ["a": 1]
var dict2 = ["b": 2]
dict1.merge(dict2) { (current, _) in current }
print(dict1) // ["a": 1, "b": 2]
```

## Filter elements

```swift
let filtered = dict.filter { $0.value > 1 }
```

## Map elements

```swift
let mapped = dict.mapValues { $0 * 2 }
```

## Sort elements

```swift
let sorted = dict.sorted { $0.value < $1.value }
```

## Group elements

```swift
let grouped = Dictionary(grouping: ["a", "b", "c"]) { $0.first! }
print(grouped) // ["a": ["a"], "b": ["b"], "c": ["c"]]
// more complex example
let grouped = Dictionary(grouping: ["a", "b", "c"]) { $0.count }
print(grouped) // [1: ["a", "b", "c"]]
// another example
let grouped = Dictionary(grouping: ["a", "b", "c"]) { $0.count > 1 }
print(grouped) // [false: ["a", "b", "c"]]
```

## Initialize from sequence

```swift
let dict = Dictionary(uniqueKeysWithValues: [("a", 1), ("b", 2)])
print(dict) // ["a": 1, "b": 2]
```

## Initialize from sequence with closure

```swift
let dict = Dictionary(uniqueKeysWithValues: ["a", "b", "c"]
                        .enumerated()
                        .map { ($0.element, $0.offset) })
print(dict) // ["a": 0, "b": 1, "c": 2]
```

## Initialize from sequence with closure

```swift
let dict = Dictionary(uniqueKeysWithValues: ["a", "b", "c"]
                        .map { ($0, $0.count) })
print(dict) // ["a": 1, "b": 1, "c": 1]
```

## Initialize from sequence with closure

```swift
let dict = Dictionary(uniqueKeysWithValues: ["a", "b", "c"]
                        .map { ($0, $0.count > 1) })
print(dict) // ["a": false, "b": false, "c": false]
```

## Initialize from sequence with closure

```swift
let dict = Dictionary(uniqueKeysWithValues: ["a", "b", "c"]
                        .map { ($0, $0.first!) })
print(dict) // ["a": "a", "b": "b", "c": "c"]
```
