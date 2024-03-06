# Basic number operations in Swift

```swift
// Int的最大值
let maxInt = Int.max
print(maxInt) // 9223372036854775807

// Int的最小值
let minInt = Int.min
print(minInt) // -9223372036854775808

// Int的位数
let bitCount = Int.bitWidth
print(bitCount) // 64

// Int的字节数
let byteCount = MemoryLayout<Int>.size
print(byteCount) // 8

// Int的最大值
let maxInt8 = Int8.max
print(maxInt8) // 127

// Int的最小值
let minInt8 = Int8.min
print(minInt8) // -128

// 取若干数最大值
let maximum = max(1, 2, 3, 4, 5)
print(max) // 5

// 取若干数最小值
let minimum = min(1, 2, 3, 4, 5)

// 取绝对值
let absValue = abs(-5)
print(absValue) // 5

// 取余数
let remainder = 5 % 3
print(remainder) // 2

// 取商
let quotient = 5 / 3
print(quotient) // 1

// 取商和余数
let result = 5.quotientAndRemainder(dividingBy: 3)
print(result.quotient) // 1
print(result.remainder) // 2

// 取平方根
let squareRoot = sqrt(9)
print(squareRoot) // 3.0

// 取立方根
let cubeRoot = cbrt(27)
print(cubeRoot) // 3.0

// 取幂
let power = pow(2, 3)
print(power) // 8.0

// 取幂
let power2 = 2 ** 3

// 取幂
infix operator **
func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}
let power3 = 2 ** 3

// sin
let sinValue = sin(3.14)
print(sinValue) // 0.0015926529164868282

// statistics operations
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0, +)
print(sum) // 15
let average = Double(sum) / Double(numbers.count)
print(average) // 3.0
let max = numbers.max()
print(max) // 5
let min = numbers.min()
print(min) // 1
// median
let sorted = numbers.sorted()
let middle = sorted.count / 2
let median = sorted.count % 2 == 0 ? Double(sorted[middle] + sorted[middle - 1]) / 2 : Double(sorted[middle])
print(median) // 3.0

// round
let roundValue = round(3.14)
print(roundValue) // 3.0

// ceil
let ceilValue = ceil(3.14)
print(ceilValue) // 4.0

// floor
let floorValue = floor(3.14)
print(floorValue) // 3.0

// random number
let random = Int.random(in: 1...10)
print(random) // 5

// random number
let random2 = Int.random(in: 1..<10)
print(random2) // 5

// random number
let random3 = Double.random(in: 1...10)

// random number
let random4 = Double.random(in: 1..<10)

// change random seed base on time
srand48(Int(Date().timeIntervalSince1970))



```
