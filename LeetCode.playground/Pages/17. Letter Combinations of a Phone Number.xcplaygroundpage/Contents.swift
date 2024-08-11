/*:
 ## Backtracking
 ### Time: O((4^N)*N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let digits = Array(digits)
        let len = digits.count
        let digitLetter : [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
            ]
        var ans = [String]()

        guard len > 0 else { return ans }
        
        func dfs(startIdx: Int, path: [String]) {
            var path = path
            if path.count == len {
                ans.append(path.joined())
                return
            }
            for letter in digitLetter[digits[startIdx], default: []] {
                path.append(letter)
                dfs(startIdx: startIdx + 1, path: path)
                path.popLast()
            }
        }

        dfs(startIdx: 0, path: [])

        return ans
    }
}


let s = Solution().letterCombinations

s("23")
s("")
s("2")
s("234")
