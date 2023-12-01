/*:
 ## Hashtable
 ### Time: O(N²)
 ### Space: O(N²)
 ![submission](1.png)
 */
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowHash = [Int: Set<Character>]()
        var columnHash = [Int: Set<Character>]()
        var boxHash = [Int: Set<Character>]()

        for i in 0..<9 {
            for j in 0..<9 {
                let char = board[i][j]
                guard char != "." else { continue }

                if !rowHash[i, default: []].insert(char).inserted {
                    return false
                }

                if !columnHash[j, default: []].insert(char).inserted {
                    return false
                }

                let boxNumber = (i / 3) * 3 + (j / 3)
                if !boxHash[boxNumber, default: []].insert(char).inserted {
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
