/*:
 ### Time: O(mn)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        var firstRowZero = false
        var firstColoumnZero = false

        for y in 0 ..< n {
            if matrix[0][y] == 0 {
                firstRowZero = true
            }
        }

        for x in 0 ..< m {
            if matrix[x][0] == 0 {
                firstColoumnZero = true
            }
        }

        for x in 1 ..< m {
            for y in 1 ..< n {
                if matrix[x][y] == 0 {
                    matrix[x][0] = 0
                    matrix[0][y] = 0
                }
            }
        }

        for x in 1 ..< m {
            for y in 1 ..< n {
                if matrix[x][0] == 0 || matrix[0][y] == 0 {
                    matrix[x][y] = 0
                }
            }
        }

        if firstRowZero {
            for y in 0 ..< n {
                matrix[0][y] = 0
            }
        }

        if firstColoumnZero {
            for x in 0 ..< m {
                matrix[x][0] = 0
            }
        }
    }
}

let input = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]

let s = Solution().setZeroes

s(input)

/*:
 ### Time: O(mn)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count

        for x in 0 ..< m {
            for y in 0 ..< n {
                if matrix[x][y] == Int.min || matrix[x][y] != 0 {
                    continue
                }

                for r in 0 ..< m {
                    if matrix[r][y] != 0 {
                        matrix[r][y] = Int.min
                    }
                }
                for c in 0 ..< n {
                    if matrix[x][c] != 0 {
                        matrix[x][c] = Int.min
                    }
                }
            }
        }

        for x in 0 ..< m {
            for y in 0 ..< n {
                if matrix[x][y] == Int.min {
                    matrix[x][y] = 0
                }
            }
        }
    }
}

let input = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]

let s2 = Solution2().setZeroes

s2(input)

/*:
 ### Time: O(mn)
 ### Space: O(mn)
 ![submission](3.png)
 */
class Solution3 {
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        var x = 0, y = 0

        for x in 0 ..< m {
            for y in 0 ..< n {
                if visited[x][y] {
                    continue
                }
                visited[x][y] = true

                if matrix[x][y] != 0 {
                    continue
                } else {
                    for r in 0 ..< m {
                        if matrix[r][y] != 0 {
                            matrix[r][y] = 0
                            visited[r][y] = true
                        }
                    }
                    for c in 0 ..< n {
                        if matrix[x][c] != 0 {
                            matrix[x][c] = 0
                            visited[x][c] = true
                        }
                    }
                }
            }
        }
    }
}

let input = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]

let s3 = Solution3().setZeroes

s3(input)
