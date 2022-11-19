/*:
 ## Dynamic Programming (Bottom Up) + Optimized Memoization
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 1 else { return triangle[0][0] }
        
        var memo = triangle.last!
        
        for i in (0..<triangle.count - 1).reversed() {
            for j in 0..<triangle[i].count {
                memo[j] = triangle[i][j] + min(memo[j], memo[j + 1])
            }
        }
        
        return memo[0]
    }
}

let s = Solution().minimumTotal

s([[2],[3,4],[6,5,7],[4,1,8,3]])
s([[-10]])

/*:
 ## Dynamic Programming (Bottom Up) + Memoization
 ### Time: O(N)
 ### Space: O(N²)
 ![submission](2.png)
 */
class Solution2 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 1 else { return triangle[0][0] }
        
        var memo: [[Int]] = Array(repeating: Array(repeating: Int.max, count: triangle.count), count: triangle.count)
        
        memo[triangle.count - 1] = triangle.last!
        
        for i in (0..<triangle.count - 1).reversed() {
            for j in 0..<triangle[i].count {
                memo[i][j] = triangle[i][j] + min(memo[i + 1][j], memo[i + 1][j + 1])
            }
        }
        
        return memo[0][0]
    }
}

let s2 = Solution2().minimumTotal

s2([[2],[3,4],[6,5,7],[4,1,8,3]])
s2([[-10]])


/*:
 ## Dynamic Programming (Top Down) + Memoization
 ### Time: O(N)
 ### Space: O(N²)
 ![submission](3.png)
 */
class Solution3 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var memo: [[Int]] = Array(repeating: Array(Array(repeating: Int.max, count: triangle.count)), count: triangle.count)

        func path(_ n: Int, _ index: Int) -> Int {
            if n == triangle.count - 1 {
                memo[n][index] = triangle[n][index]
                return memo[n][index]
            }
            if index < 0 || index > n {
                return 100000
            }
            if memo[n][index] < Int.max {
                return memo[n][index]
            }

            memo[n][index] = triangle[n][index] + min(path(n + 1, index + 1), path(n + 1, index))
            return memo[n][index]
        }

        return path(0, 0)
    }
}

let s3 = Solution3().minimumTotal

s3([[2],[3,4],[6,5,7],[4,1,8,3]])
s3([[-10]])
