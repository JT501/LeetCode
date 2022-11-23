/*:
 ## Hashtable
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](1.png)
 */
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var iHash = [Int: Set<Character>]()
        var jHash = [Int: Set<Character>]()
        var kHash = [Int: Set<Character>]() //k is index of sub-boxes
                
        for i in 0..<9 {
            for j in 0..<9 {
                let num = board[i][j]
                guard num != "." else { continue }
                
                if !iHash[i, default: []].insert(num).inserted {
                    return false
                }
                
                if !jHash[j, default: []].insert(num).inserted {
                    return false
                }
                
                let k = 3 * (i / 3) + j / 3
                
                if !kHash[k, default: []].insert(num).inserted {
                    return false
                }
            }
        }
        
        return true
    }
}

let s = Solution().isValidSudoku

s([["5","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]])

s([["8","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]])
