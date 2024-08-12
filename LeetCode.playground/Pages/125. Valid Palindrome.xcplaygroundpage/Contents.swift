/*:
 ## Two Pointers
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var s = Array(s.lowercased().filter{$0.isLetter || $0.isNumber})
        var left = 0, right = s.count - 1

        while left < right {
            if s[left] != s[right] {
                return false
            }
            left += 1
            right -= 1
        }

        return true
    }
}
