/*:
 ## Backtracking
 ### Time: O(4ᴺ/√N)
 ### Space: O(4ᴺ/√N)
 ![submission](1.png)
 */
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var comb = [Character]()
        var ans = [String]()
        
        func backtracking(_ openCount: Int, _ closeCount: Int) {
            if openCount == n {
                ans.append(String(comb+Array(repeating: ")", count: n-closeCount)))
                return
            }
            
            if openCount < n {
                comb.append("(")
                backtracking(openCount+1, closeCount)
                comb.removeLast()
                
                if openCount > closeCount {
                    comb.append(")")
                    backtracking(openCount, closeCount+1)
                    comb.removeLast()
                }
            }
        }
        
        backtracking(0, 0)
        
        return ans
    }
}

let s = Solution().generateParenthesis

s(1)
s(2)
s(3)
s(4)
