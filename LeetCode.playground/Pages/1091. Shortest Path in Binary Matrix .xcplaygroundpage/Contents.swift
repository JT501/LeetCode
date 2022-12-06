/*:
 ## Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var m = grid.count, n = grid[0].count
        var queue = [[Int]]()
        var visited = Set<[Int]>()
        var step = 0
        var directions = [[1,0],[-1,0],[0,1],[0,-1],[1,1],[1,-1],[-1,1],[-1,-1]]
    
        guard grid[0][0] == 0 && grid[m-1][n-1] == 0 else { return -1 }

        queue.append([0, 0])
        visited.insert([0, 0])

        
        while !queue.isEmpty {
            step += 1
            
            for _ in 0..<queue.count {
                let current = queue.removeFirst()
                
                if current == [m-1, n-1] {
                    return step
                }
                
                for direction in directions {
                    let x = current[0] + direction[0]
                    let y = current[1] + direction[1]
                    
                    guard (0..<m) ~= x && (0..<n) ~= y else { continue }
                    
                    if grid[x][y] == 0 && !visited.contains([x, y]) {
                        queue.append([x, y])
                        visited.insert([x, y])
                    }
                }
            }
        }
        
        return -1
    }
}
