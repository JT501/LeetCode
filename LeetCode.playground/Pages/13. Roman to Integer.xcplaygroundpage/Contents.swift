/*:
 ## Hashtable
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let s = Array(s)
        
        var last = 5000
        var res = 0
        
        for c in s {
            let r = roman[c]!
            res += r > last ? r - last - last : r
            last = r
        }
        
        return res
    }
}

let s = Solution().romanToInt

s("III")
s("LVIII")
s("MCMXCIV")
