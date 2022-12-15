/*:
 ## Dynamic Programming (Bottom-Up + Space Optimized)
 ### Time: O(M*N)
 ### Space: O(min(M,N))
 ![submission](1.png)
 */
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = Array(text1), text2 = Array(text2)
        var len1 = text1.count, len2 = text2.count
        var prev = Array(repeating: 0, count: min(len1, len2)+1)
        var curr = Array(repeating: 0, count: min(len1, len2)+1)
        
        if len1 < len2 {
            let temp = text1
            text1 = text2
            text2 = temp
        }
        
        for i in (0..<max(len1, len2)).reversed() {
            for j in (0..<min(len1, len2)).reversed() {
                if text1[i] == text2[j] {
                    curr[j] = prev[j+1] + 1
                } else {
                    curr[j] = max(prev[j], curr[j+1])
                }
            }
            let temp = prev
            prev = curr
            curr = temp
        }
        
        return prev[0]
    }
}

let s = Solution().longestCommonSubsequence

s("abcde", "ace")
s("abc", "abc")
s("abc", "def")
s("bl", "yby")

/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](2.png)
 */
class Solution2 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = Array(text1), text2 = Array(text2)
        var len1 = text1.count, len2 = text2.count
        var dp = Array(repeating: Array(repeating: 0, count: len2+1), count: len1+1)
        
        for i in (0..<len1).reversed() {
            for j in (0..<len2).reversed() {
                if text1[i] == text2[j] {
                    dp[i][j] = dp[i+1][j+1] + 1
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j+1])
                }
            }
        }
        
        return dp[0][0]
    }
}

let s2 = Solution2().longestCommonSubsequence

s2("abcde", "ace")
s2("abc", "abc")
s2("abc", "def")
s2("bl", "yby")

/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](3.png)
 */
class Solution3 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var text1 = Array(text1), text2 = Array(text2)
        var len1 = text1.count, len2 = text2.count
        var dp = Array(repeating: Array(repeating: -1, count: len2), count: len1)
        
        func findLongest(_ i: Int, _ j: Int) -> Int {
            if i < 0 || j < 0 {
                return 0
            }
            
            if dp[i][j] != -1 {
                return dp[i][j]
            }
            if text1[i] == text2[j] {
                dp[i][j] = findLongest(i-1, j-1) + 1
            } else {
                dp[i][j] = max(findLongest(i-1, j), findLongest(i, j-1))
            }
            
            return dp[i][j]
        }
        
        return findLongest(len1-1, len2-1)
    }
}

let s3 = Solution3().longestCommonSubsequence

s3("abcde", "ace")
s3("abc", "abc")
s3("abc", "def")
