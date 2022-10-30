/*:
 ## Sliding Window
 */

class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var start = 0
        var charMap: [Character: Int] = [:]
        var longest = 0
        var sArr = Array(s)
        
        for (end, char) in sArr.enumerated() {
            if charMap[char] != nil {
                charMap[char]! += 1
            } else {
                charMap[char] = 1
            }
            
            while charMap.count > k {
                charMap[sArr[start]]! -= 1
                if charMap[sArr[start]] == 0 {
                    charMap.removeValue(forKey: sArr[start])
                }
                start += 1
            }
            
            longest = max(longest, end - start + 1)
        }
        
        return longest
    }
}

let s = Solution()

s.lengthOfLongestSubstringKDistinct("eceba", 2)
s.lengthOfLongestSubstringKDistinct("aa", 1)
s.lengthOfLongestSubstringKDistinct("character", 4)

class Solution2 {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        var start = 0
        var distinct = 0
        var charIndex: [Character: Int] = [:]
        var longest = 0
        var sArr = Array(s)
        
        for (end, char) in sArr.enumerated() {
            if charIndex[char] == nil || charIndex[char]! < start {
                distinct += 1
            }
            
            while distinct > k {
                if let index = charIndex[sArr[start]], index > start {
                    start += 1
                } else {
                    start += 1
                    distinct -= 1
                }
            }
            
            longest = max(longest, end - start + 1)
            charIndex[char] = end
        }
        
        return longest
    }
}

let s2 = Solution2()

s2.lengthOfLongestSubstringKDistinct("eceba", 2)
s2.lengthOfLongestSubstringKDistinct("aa", 1)
s2.lengthOfLongestSubstringKDistinct("character", 4)
