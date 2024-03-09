51. N Queen

## 解法 1

```swift
class Solution {
  // leetcode 51 N queen
  func solveNQueens(_ n: Int) -> [[String]] {
    var results = [[String]]()
    var queens = Array(repeating: -1, count: n)
    var columns = Set<Int>() // 已占用的列
    var diagonals1 = Set<Int>() // 主对角线
    var diagonals2 = Set<Int>() // 副对角线
    backtrack(row: 0, n: n, queens: &queens, columns: &columns, diagonals1: &diagonals1, diagonals2: &diagonals2, results: &results)

    return results
  }

  private func backtrack(row: Int, n: Int, queens: inout [Int], columns: inout Set<Int>, diagonals1: inout Set<Int>, diagonals2: inout Set<Int>, results: inout [[String]]) {
    if row == n {
      // 所有的皇后都已放置完毕，转换结果并保存
      results.append(generateBoard(queens, n))
    } else {
      for col in 0..<n {
        if columns.contains(col) {
          continue
        }
        let diagonal1 = row - col
        if diagonals1.contains(diagonal1) {
          continue
        }
        let diagonal2 = row + col
        if diagonals2.contains(diagonal2) {
          continue
        }
        // 放置皇后
        queens[row] = col
        columns.insert(col)
        diagonals1.insert(diagonal1)
        diagonals2.insert(diagonal2)
        // 继续下一行
        backtrack(row: row + 1, n: n, queens: &queens, columns: &columns, diagonals1: &diagonals1, diagonals2: &diagonals2, results: &results)
        // 回溯，撤销皇后
        queens[row] = -1
        columns.remove(col)
        diagonals1.remove(diagonal1)
        diagonals2.remove(diagonal2)
      }
    }
  }

  private func generateBoard(_ queens: [Int], _ n: Int) -> [String] {
    var board = [String]()
    for i in 0..<n {
      var row = Array(repeating: ".", count: n)
      row[queens[i]] = "Q"
      board.append(row.joined())
    }
    return board
  }
}

在一个 N x N 的棋盘上，主对角线的特点是行列坐标的差值是固定的，副对角线的特点是行列坐标的和是固定的。所以可以使用两个集合分别记录已占用的主对角线和副对角线。


+-------+-------+-------+-------+
| (0,0) | (0,1) | (0,2) | (0,3) |
+-------+-------+-------+-------+
| (1,0) | (1,1) | (1,2) | (1,3) |
+-------+-------+-------+-------+
| (2,0) | (2,1) | (2,2) | (2,3) |
+-------+-------+-------+-------+
| (3,0) | (3,1) | (3,2) | (3,3) |
+-------+-------+-------+-------+
```

## 解法 2

```swift
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var solutions = [[String]]()
        var board = Array(repeating: Array(repeating: ".", count: n), count: n)

        func isValid(_ row: Int, _ col: Int) -> Bool {
            // 检查同一列是否有皇后冲突
            for i in 0..<row {
                if board[i][col] == "Q" {
                    return false
                }
            }

            // 检查左上方是否有皇后冲突
            var i = row - 1
            var j = col - 1
            while i >= 0 && j >= 0 {
                if board[i][j] == "Q" {
                    return false
                }
                i -= 1
                j -= 1
            }

            // 检查右上方是否有皇后冲突
            i = row - 1
            j = col + 1
            while i >= 0 && j < n {
                if board[i][j] == "Q" {
                    return false
                }
                i -= 1
                j += 1
            }

            return true
        }

        func backtrack(_ row: Int) {
            if row == n {
                // 找到一个有效的解
                var solution = [String]()
                for i in 0..<n {
                    solution.append(String(board[i]))
                }
                solutions.append(solution)
                return
            }

            for col in 0..<n {
                if isValid(row, col) {
                    board[row][col] = "Q"
                    backtrack(row + 1)
                    board[row][col] = "."
                }
            }
        }

        backtrack(0)

        return solutions
    }
}
```
