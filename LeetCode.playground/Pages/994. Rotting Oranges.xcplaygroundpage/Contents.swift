/*:
 ## Breadth First Search
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](1.png)
 */
class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var m = grid.count, n = grid[0].count
        var directions = [(-1,0),(1,0),(0,-1),(0,1)]
        var queue = [(Int, Int)]()
        var step = 0
        var fresh = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 2 {
                    queue.append((i,j))
                } else if grid[i][j] == 1 {
                    fresh += 1
                }
            }
        }
        
        while !queue.isEmpty && fresh > 0 {
            step += 1
            
            for _ in 0..<queue.count {
                let (i,j) = queue.removeFirst()
                
                for direction in directions {
                    let (x, y) = (i + direction.0, j + direction.1)
                    
                    guard x >= 0 && y >= 0 && x < m && y < n else { continue }
                    
                    if grid[x][y] == 1 {
                        grid[x][y] = 2
                        fresh -= 1
                        queue.append((x,y))
                    }
                }
            }
        }
        
        return fresh == 0 ? step : -1
    }
}

let s = Solution().orangesRotting

s([[2,1,1],[1,1,0],[0,1,1]])
s([[2,1,1],[0,1,1],[1,0,1]])
s([[0,2]])
s([[0]])
s([[1],[1],[1],[1]])
