/*:
 ## Breadth First Search
 ### Time: O(M*N)
 ### Space: O(min(M,N))
 ![submission](1.png)
 */
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var islands = 0
        
        let directions = [(-1,0), (1,0), (0,-1), (0,1)]
        
        var queue: [(Int, Int)] = []
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    islands += 1
                    
                    grid[i][j] = "0"
                    queue.append((i, j))
                    
                    while !queue.isEmpty {
                        let cur = queue.removeFirst()
                        
                        for direction in directions {
                            let x = cur.0 + direction.0
                            let y = cur.1 + direction.1
                            
                            guard x >= 0 && y >= 0 && x < m && y < n else { continue }
                            
                            if grid[x][y] == "1" {
                                grid[x][y] = "0"
                                queue.append((x, y))
                            }
                        }
                    }
                }
            }
        }
        
        return islands
    }
}

let s = Solution()

s.numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
s.numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]])

/*:
 ## Depth First Search
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](2.png)
 */
class Solution2 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var islands = 0
        
        let directions = [(-1,0), (1,0), (0,-1), (0,1)]
        
        func dfs(_ i: Int, _ j: Int) {
            guard grid[i][j] != "0" else { return }
            
            grid[i][j] = "0"
            
            for direction in directions {
                let i = i + direction.0
                let j = j + direction.1
                
                guard i >= 0 && j >= 0 && i < m && j < n else { continue }
                
                if grid[i][j] == "1" {
                    dfs(i, j)
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == "1" {
                    dfs(i,j)
                    islands += 1
                }
            }
        }
        
        return islands
    }
}

let s2 = Solution2()

s2.numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
s2.numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]])
