/*:
 ## Depth First Search
 ### Time: O(N*M)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        
        var maxArea = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    var area = 0
                    dfs(i, j, area: &area)
                    maxArea = max(maxArea, area)
                }
            }
        }
        
        func dfs(_ i: Int, _ j: Int, area: inout Int) {
            let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            
            area += 1
            grid[i][j] = 0
            
            for direction in directions {
                let x = i + direction.0
                let y = j + direction.1
                
                guard x >= 0 && y >= 0 && x < m && y < n else { continue }
                
                if grid[x][y] == 1 {
                    dfs(x, y, area: &area)
                }
            }
        }
        
        return maxArea
    }
}

let s = Solution()

s.maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]])
s.maxAreaOfIsland([[0,0,0,0,0,0,0,0]])
