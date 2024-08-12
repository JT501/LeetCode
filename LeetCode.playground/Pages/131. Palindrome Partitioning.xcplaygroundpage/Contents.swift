/*:
 ## Backtracking
 ### Time: O(2^N*N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        let len = s.count
        var ans = [[String]]()

        func dfs(start: Int, path: [String]) {
            var path = path

            if start == len {
                ans.append(path)
                return
            }

            for i in start..<len {
                let nextPrefix = Array(s[start...i])
                
                if isPalindrome(nextPrefix) {
                    path.append(String(nextPrefix))
                    dfs(start: start + nextPrefix.count, path: path)
                    path.popLast()
                }
            }
        }

        dfs(start: 0, path: [])

        return ans
    }

    func isPalindrome(_ str: [Character]) -> Bool {
        var s = str
        var left = 0, right = s.count - 1

        while left < right {
            if s[left] != s[right] {
                return false
            }
            left += 1
            right -= 1
        }

        return true
    }
}
