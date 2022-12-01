/*:
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        var s = Array(s)
        let vowels: Set<Character> = ["a","e","i","o","u"]
        var counterA = 0
        var counterB = 0
        
        for i in 0..<s.count {
            let char = Character(s[i].lowercased())
            if vowels.contains(char) {
                if i < s.count / 2 {
                    counterA += 1
                } else {
                    counterB += 1
                }
            }
        }
        
        return counterA == counterB
    }
}

let s = Solution().halvesAreAlike

s("book")
s("textbook")
