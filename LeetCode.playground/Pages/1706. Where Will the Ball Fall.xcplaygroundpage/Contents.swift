/*:
 ## Depth First Search
 */

class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let m = grid.count
        let n = grid[0].count
        
        var ans = Array(repeating: -1, count: n)
        
        func dfs(_ i: Int, _ j: Int) -> Int {
            // Reach bottom
            if i == m {
                return j
            }
            
            // If 1, move right
            if grid[i][j] == 1 {
                // right side is not wall and not stuck
                if j + 1 < n, grid[i][j] + grid[i][j + 1] != 0 {
                    return dfs(i + 1, j + 1)
                } else {
                    return -1
                }
            }
            // else move left
            else {
                // left side is not wall and not stuck
                if j - 1 >= 0, grid[i][j] + grid[i][j - 1] != 0 {
                    return dfs(i + 1, j - 1)
                } else {
                    return -1
                }
            }
        }
        
        for i in 0..<n {
            ans[i] = dfs(0, i)
        }
        
        return ans
    }
}

let s = Solution()

s.findBall([[1,1,1,-1,-1],[1,1,1,-1,-1],[-1,-1,-1,1,1],[1,1,1,1,-1],[-1,-1,-1,-1,-1]])
s.findBall([[-1]])
s.findBall([[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1],[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1]])
