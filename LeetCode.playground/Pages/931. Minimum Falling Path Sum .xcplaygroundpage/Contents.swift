/*:
 ## Dynamic Programming (Bottom-Up + Space Optimized)
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](1.png)
 */
class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        var dp: [Int] = Array(repeating: 0, count: n+1)
        var ans = Int.max
        
        for row in (0..<n).reversed() {
            var currentRow = Array(repeating: 0, count: n+1)
            for col in 0..<n {
                if col == 0 {
                    currentRow[col] = min(dp[col], dp[col+1]) + matrix[row][col]
                } else if col == n-1 {
                    currentRow[col] = min(dp[col], dp[col-1]) + matrix[row][col]
                } else {
                    currentRow[col] = min(dp[col], dp[col-1], dp[col+1]) + matrix[row][col]
                }
            }
            dp = currentRow
        }
        
        for i in 0..<n {
            ans = min(ans, dp[i])
        }
        
        return ans
    }
}

let s = Solution().minFallingPathSum

s([[2,1,3],[6,5,4],[7,8,9]])
s([[-19,57],[-40,-5]])
s([[-80,-13,22],[83,94,-5],[73,-48,61]])

/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](2.png)
 */
class Solution2 {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        var ans = Int.max
        
        for row in (0..<n).reversed() {
            for col in 0..<n {
                if col == 0 {
                    dp[row][col] = min(dp[row+1][col], dp[row+1][col+1]) + matrix[row][col]
                } else if col == n-1 {
                    dp[row][col] = min(dp[row+1][col], dp[row+1][col-1]) + matrix[row][col]
                } else {
                    dp[row][col] = min(dp[row+1][col], dp[row+1][col-1], dp[row+1][col+1]) + matrix[row][col]
                }
            }
        }
        
        for i in 0..<n {
            ans = min(ans, dp[0][i])
        }
        
        return ans
    }
}

let s2 = Solution2().minFallingPathSum

s2([[2,1,3],[6,5,4],[7,8,9]])
s2([[-19,57],[-40,-5]])
s2([[-80,-13,22],[83,94,-5],[73,-48,61]])


/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](3.png)
 */
class Solution3 {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        var memo: [[Int]] = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        let directions = [[1, 0],[1,1],[1,-1]]
        var ans = Int.max
        
        func getMin(_ row: Int, _ col: Int) -> Int {
            guard (0..<n) ~= col && (0..<n) ~= row else { return Int.max }
            
            if row == n-1 {
                return matrix[row][col]
            }
            
            if memo[row][col] != Int.max {
                return memo[row][col]
            }
            
            var minSum = Int.max
            for direction in directions {
                let x = row + direction[0]
                let y = col + direction[1]
                
                minSum = min(minSum, getMin(x, y))
            }
            
            memo[row][col] = minSum + matrix[row][col]
            
            return memo[row][col]
        }
        
        for i in 0..<n {
            ans = min(ans, getMin(0, i))
        }
        
        return ans
    }
}

let s3 = Solution3().minFallingPathSum

s3([[2,1,3],[6,5,4],[7,8,9]])
s3([[-19,57],[-40,-5]])
s3([[-80,-13,22],[83,94,-5],[73,-48,61]])
