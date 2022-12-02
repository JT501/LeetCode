/*:
 ## Hashtable
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }
        
        var hashmap1 = [Character: Int](), hashmap2 = [Character: Int]()
        
        for i in word1.indices {
            hashmap1[word1[i], default: 0] += 1
            hashmap2[word2[i], default: 0] += 1
        }
        
        if hashmap1.count != hashmap2.count { return false }
        
        // Operation 1: both strings should have same characters
        for (k, _) in hashmap1 {
            if hashmap2[k, default: 0] == 0 {
                return false
            }
        }
        
        // Sorted by occurence
        var sorted1 = hashmap1.sorted(by: { $0.value < $1.value })
        var sorted2 = hashmap2.sorted(by: { $0.value < $1.value })
        
        // Operation 2: both strings should have same characters occurence
        for i in 0..<sorted1.count {
            if sorted1[i].value != sorted2[i].value {
                return false
            }
        }
        
        return true
    }
}

let s = Solution().closeStrings

s("abc", "bca")
s("a", "aa")
s("cabbba", "abbccc")
