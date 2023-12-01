/*:
 ### Time: O(mn)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var matrix = matrix
        let m = matrix.count
        let n = matrix[0].count
        let visited = 101
        var result = [Int]()

        rowTransverse(row: 0, start: 0, moveRight: true)

        func rowTransverse(row: Int, start: Int, moveRight: Bool) {
            guard (0 ..< n) ~= start, matrix[row][start] != visited else { return }
            var lastCol = start

            for y in moveRight ? stride(from: start, through: n - 1, by: 1) : stride(from: start, through: 0, by: -1) {
                if matrix[row][y] == visited {
                    break
                }
                lastCol = y
                result.append(matrix[row][y])
                matrix[row][y] = visited
            }

            colTransverse(col: lastCol, start: moveRight ? row + 1 : row - 1, moveDown: moveRight)
        }

        func colTransverse(col: Int, start: Int, moveDown: Bool) {
            guard (0 ..< m) ~= start, matrix[start][col] != visited else { return }
            var lastRow = start

            for x in moveDown ? stride(from: start, through: m - 1, by: 1) : stride(from: start, through: 0, by: -1) {
                if matrix[x][col] == visited {
                    break
                }
                lastRow = x
                result.append(matrix[x][col])
                matrix[x][col] = visited
            }

            rowTransverse(row: lastRow, start: moveDown ? col - 1 : col + 1, moveRight: !moveDown)
        }

        return result
    }
}

let s = Solution().spiralOrder

s([[1]])
s([[1], [2]])
s([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])

/*:
 ### Time: O(mn)
 ### Space: O(m + n)
 ![submission](2.png)
 */
class Solution2 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        let n = matrix[0].count
        var result = [Int]()

        var visitedRow = Set<Int>()
        var visitedCol = Set<Int>()

        rowTransverse(row: 0, start: 0, moveRight: true)

        func rowTransverse(row: Int, start: Int, moveRight: Bool) {
            guard !visitedCol.contains(start), (0 ..< n) ~= start else { return }
            var lastCol = start

            for y in moveRight ? stride(from: start, through: n - 1, by: 1) : stride(from: start, through: 0, by: -1) {
                if visitedCol.contains(y) {
                    break
                }
                lastCol = y
                result.append(matrix[row][y])
            }

            visitedRow.insert(row)
            colTransverse(col: lastCol, start: moveRight ? row + 1 : row - 1, moveDown: moveRight)
        }

        func colTransverse(col: Int, start: Int, moveDown: Bool) {
            guard !visitedRow.contains(start), (0 ..< m) ~= start else { return }
            var lastRow = start

            for x in moveDown ? stride(from: start, through: m - 1, by: 1) : stride(from: start, through: 0, by: -1) {
                if visitedRow.contains(x) {
                    break
                }
                lastRow = x
                result.append(matrix[x][col])
            }

            visitedCol.insert(col)
            rowTransverse(row: lastRow, start: moveDown ? col - 1 : col + 1, moveRight: !moveDown)
        }

        return result
    }
}

let s2 = Solution2().spiralOrder

s2([[1]])
s2([[1], [2]])
s2([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
