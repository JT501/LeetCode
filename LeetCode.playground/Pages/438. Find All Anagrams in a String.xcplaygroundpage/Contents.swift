/*:
 ## Sliding Window + Hashtable
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var s = Array(s), p = Array(p)
        
        guard s.count >= p.count else { return [] }
        
        var hashmap = [Character: Int]()
        var hashmap2 = [Character: Int]()
        var left = 0, right = 0
        var ans = [Int]()
        
        for char in p {
            hashmap[char, default: 0] += 1
        }
        
        while right < s.count {
            let leftChar = s[left]
            let rightChar = s[right]
            
            hashmap2[rightChar, default: 0] += 1
            
            if right - left == p.count - 1 {
                if hashmap == hashmap2 { ans.append(left) }
                if hashmap[leftChar] != nil {
                    hashmap2[leftChar]! -= 1
                } else {
                    hashmap2.removeValue(forKey: leftChar)
                }
                left += 1
            }
            right += 1
        }
        
        return ans
    }
}

let s = Solution().findAnagrams

s("cbaebabacd", "abc")
s("abab", "ab")
s("abacbabc", "abc")
