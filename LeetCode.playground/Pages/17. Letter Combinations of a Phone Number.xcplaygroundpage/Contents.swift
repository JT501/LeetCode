/*:
 ## Backtracking
 ### Time: O((4^N)*N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        
        let digits = Array(digits).map({$0.wholeNumberValue!})
        let len = digits.count
        var letters: [[Character]] = [[],
                                      [],["a","b","c"],["d","e","f"],
                                      ["g","h","i"],["j","k","l"],["m","n","o"],
                                      ["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
        var comb = [Character]()
        var ans = [String]()
        
        func backtracking(_ i: Int) {
            if comb.count == len {
                ans.append(String(comb))
                return
            }
            if i < len {
                for j in 0..<letters[digits[i]].count {
                    comb.append(letters[digits[i]][j])
                    backtracking(i + 1)
                    comb.removeLast()
                }
            }
        }
        backtracking(0)
        
        return ans
    }
}

let s = Solution().letterCombinations

s("23")
s("")
s("2")
s("234")
