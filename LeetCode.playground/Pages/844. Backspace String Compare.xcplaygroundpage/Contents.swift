/*:
 ## Two Pointers
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var s = Array(s)
        var t = Array(t)
        
        var i = s.count - 1, j = t.count - 1
        var skipS = 0, skipT = 0
        
        while i >= 0 || j >= 0 {
            while i >= 0 {
                if s[i] == "#" {
                    skipS += 1
                    i -= 1
                } else if skipS > 0 {
                    skipS -= 1
                    i -= 1
                } else {
                    break
                }
            }
            while j >= 0 {
                if t[j] == "#" {
                    skipT += 1
                    j -= 1
                } else if skipT > 0 {
                    skipT -= 1
                    j -= 1
                } else {
                    break
                }
            }
            if i >= 0 && j >= 0 && s[i] != t[j] {
                return false
            }
            if (i >= 0) != (j >= 0) {
                return false
            }
            i -= 1
            j -= 1
        }
        
        return true
    }
}

let s = Solution().backspaceCompare

s("ab#c", "ad#c")
s("ab##", "c#d#")
s("a#c", "b")
s("#", "bb##")
