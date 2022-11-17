/*:
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic: [Character: Int] = [:]
        var startIndex: Int = 0
        var maxLength: Int = 0
        
        for (index, char) in s.enumerated() {
            if let foundIndex = dic[char] {
                startIndex = max(foundIndex + 1, startIndex)
            }
            
            maxLength = max(maxLength, index - startIndex + 1)
            dic[char] = index
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
