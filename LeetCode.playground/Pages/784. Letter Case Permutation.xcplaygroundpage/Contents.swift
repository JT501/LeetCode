/*:
 ## Backtracking
 ### Time: O(2^N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        var res = [String]()
        var s = Array(s), len = s.count
        var comb = [Character]()
        
        func backtracking(_ i: Int) {
            if comb.count == len {
                res.append(String(comb))
            } else {
                for c in nextChars(i) {
                    comb.append(c)
                    backtracking(i + 1)
                    comb.removeLast()
                }
            }
        }
        
        func nextChars(_ index: Int) -> [Character] {
            let char = s[index]
            if !char.isLetter {
                return [char]
            } else {
                return [char, Character(char.isLowercase ? char.uppercased() : char.lowercased())]
            }
            
        }
        
        backtracking(0)
        
        return res
    }
}

let s = Solution().letterCasePermutation

s("a1b2")
s("3z4")
