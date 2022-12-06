/*:
 ## Breadth First Search
 ### Time: O(N)
 ### Space: O(max(M, N))
 ![submission](1.png)
 */
class Solution {
    func solve(_ board: inout [[Character]]) {
        let m = board.count, n = board[0].count
        let directions = [[-1,0],[1,0],[0,-1],[0,1]]
        
        guard m > 1 && n > 1 else { return }
        
        for i in 1..<m-1 {
            for j in 1..<n-1 {
                if board[i][j] == "O" {
                    var queue = [[Int]]()
                    var visited = Set<[Int]>()
                    
                    queue.append([i, j])
                    visited.insert([i, j])
                    
                    while !queue.isEmpty {
                        let current = queue.removeFirst()
                        
                        if isAtBorder(board, current[0], current[1]) {
                            visited.removeAll()
                            break
                        }
                        
                        for direction in directions {
                            let x = current[0] + direction[0]
                            let y = current[1] + direction[1]
                            
                            guard (0..<m) ~= x && (0..<n) ~= y else { continue }
                            if board[x][y] == "O" && !visited.contains([x, y]) {
                                queue.append([x, y])
                                visited.insert([x, y])
                            }
                        }
                    }
                    
                    visited.forEach { v in
                        board[v[0]][v[1]] = "X"
                    }
                }
            }
        }
    }
    
    func isAtBorder(_ board: [[Character]], _ i: Int, _ j: Int) -> Bool {
        let m = board.count, n = board[0].count
        
        return i == 0 || i == m-1 || j == 0 || j == n-1
    }
}

let s = Solution().solve

var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
var board2: [[Character]] = [["X"]]
var board3: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","O","X"]]

s(&board3)
