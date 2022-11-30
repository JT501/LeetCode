/*:
 ## Hashtable
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var hashmap = [Int: Int]()
        var occurrences = Set<Int>()
        
        for num in arr {
            hashmap[num, default: 0] += 1
        }
        
        for (_, v) in hashmap {
            if !occurrences.insert(v).inserted {
                return false
            }
        }
        
        return true
    }
}

let s = Solution().uniqueOccurrences

s([1,2,2,1,1,3])
s([1,2])
s([-3,0,1,-3,1,1,1,-3,10,0])
