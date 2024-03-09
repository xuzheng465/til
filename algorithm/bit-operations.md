# use bit operation to replace array

假如有一个整型数组 [1,2,3]，某算法需要记录元素的使用情况，在遍历数组时，如果元素被使用，则将其标记为 1，否则标记为 0。如果使用数组来记录元素的使用情况，那么需要额外的空间，而且在遍历数组时，需要额外的时间来查找元素。这时可以使用位运算来代替数组。

在遍历数组时，使用 mask 来记录元素的使用情况。用了几个数就让 1 左移几位。

让 used 与 mask 进行与运算，如果结果不为 0，则表示该元素已经被使用。

让 used 与 mask 进行或运算，可以将元素标记为已使用。

让 used 与 mask 进行异或运算，可以将元素标记为未使用。mask 使用的那位是 1，used 也为 1，异或运算会将其变为 0。

```swift
class Solution {
    var res: [[Int]] = []

    func permute(_ nums: [Int]) -> [[Int]] {
        var track: [Int] = []
        var used = 0
        backtrack(nums, &track, &used)
        return res
    }

    func backtrack(_ nums: [Int], _ track: inout [Int], _ used: inout Int) {
        guard track.count < nums.count else {
            res.append(track)
            return
        }

        for i in nums.indices {
            let mask = 1 << i
            // Q：为什么是 1<<i? 而不是 1 << i+1
            // A: 因为 1 << i 表示将 1 左移 i 位，即 1 << 0 = 1, 1 << 1 = 2, 1 << 2 = 4
            if (used & mask) != 0 {
                continue
            }

            track.append(nums[i])
            // mark nums[i] as used
            used |= mask
            backtrack(nums, &track, &used)

            track.removeLast()
            // mark nums[i] as unused

            used ^= mask
        }
    }
}
```
