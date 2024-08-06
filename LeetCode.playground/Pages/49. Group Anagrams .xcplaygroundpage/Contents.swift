/*:
 ## Strings, Hashtable
 ### Time: O(N*M) where M is length of the longest string
 ### Space: O(N*M)
 ![submission](1.png)
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var count = strs.count
        var hashtable = [[Int]: [String]]()

        for str in strs {
            var alphabetIdx = Array(repeating: 0, count: 26)
            for char in str {
                let charIdx = Int(char.asciiValue! - Character("a").asciiValue!)
                alphabetIdx[charIdx] += 1
            }
            hashtable[alphabetIdx, default: []].append(str)
        }

        return Array(hashtable.values)
    }
}
