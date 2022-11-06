class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var s = Array(s), t = Array(t)
        
        guard t.count >= s.count else { return false }

        var start = 0, end = t.count - 1
        
        while start <= end && s.count > 0 {
            if t[start] == s.first {
                s.removeFirst()
                start += 1
            } else if t[end] == s.last {
                s.removeLast()
                end -= 1
            } else {
                start += 1
                end -= 1
            }
        }
        
        return s.count == 0
    }
}

let s = Solution()

s.isSubsequence("abc", "ahbgdc")
s.isSubsequence("axc", "ahbgdc")
