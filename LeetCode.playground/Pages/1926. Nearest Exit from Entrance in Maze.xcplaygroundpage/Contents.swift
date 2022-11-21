/*:
 ## Breadth First Search
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](1.png)
 */
class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let m = maze.count, n = maze[0].count
        let directions = [(-1,0),(1,0),(0,-1),(0,1)]
        var queue = [[Int]]()
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var step = 0
        
        queue.append(entrance)
        visited[entrance[0]][entrance[1]] = true
        
        while !queue.isEmpty {
            
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                
                for direction in directions {
                    let x = cur[0] + direction.0
                    let y = cur[1] + direction.1
                    
                    guard x >= 0 && x < m && y >= 0 && y < n && maze[x][y] == "." else { continue }
                    
                    if !visited[x][y] && (x == 0 || x == m - 1 || y == 0 || y == n - 1) {
                        return step + 1
                    }
                    
                    if !visited[x][y] {
                        queue.append([x, y])
                        visited[x][y] = true
                    }
                }
            }
            
            step += 1
        }
        
        return -1
    }
}

let s = Solution().nearestExit

s([["+","+",".","+"],[".",".",".","+"],["+","+","+","."]],[1,2])
s([["+","+","+"],[".",".","."],["+","+","+"]],[1,0])
s([[".","+"]],[0,0])
