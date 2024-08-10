/*:
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var l = 0
        var charIdx = [Character: Int]()

        for (r, char) in s.enumerated() {
            if let idx = charIdx[char], idx >= l {
                l = idx + 1
            }
            charIdx[char] = r
            maxLength = max(maxLength, r - l + 1)
        }

        return maxLength
    }
}

let s = Solution()

s.lengthOfLongestSubstring("dfadsjklieunmlkcnv")
s.lengthOfLongestSubstring("abcabcbb")
s.lengthOfLongestSubstring("bbbbb")
s.lengthOfLongestSubstring("pwwkew")
s.lengthOfLongestSubstring("nfffpdmpifuifuioty")
