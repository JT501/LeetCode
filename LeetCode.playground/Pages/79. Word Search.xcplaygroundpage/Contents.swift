/*:
 ## Depth First Search
 ### Time: O(N⋅3^L), N = no. of cells, L = length of word
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    let directions = [(-1,0),(1,0),(0,-1),(0,1)]
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var word = Array(word)
        let m = board.count, n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                guard board[i][j] == word[0] else { continue }
                    
                if dfs(i, j, 0) {
                    return true
                }
            }
        }
        
        func dfs(_ i: Int, _ j: Int, _ wordIndex: Int) -> Bool {
            guard (0..<m) ~= i && (0..<n) ~= j && !visited[i][j] else { return false }
            guard board[i][j] == word[wordIndex] else { return false }
            
            if wordIndex == word.count - 1 { return true }
            
            visited[i][j] = true
            
            for direction in directions {
                let x = i + direction.0
                let y = j + direction.1
                
                if dfs(x, y, wordIndex + 1) {
                    return true
                }
            }
            
            visited[i][j] = false
            
            return false
        }
        
        return false
    }
}

let s = Solution().exist

s([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
s([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")
s([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
s([["C","A","A"],["A","A","A"],["B","C","D"]], "AAB")
