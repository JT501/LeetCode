class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var mapS = [Character: String.Index]()
        var mapT = [Character: String.Index]()
        
        for i in s.indices {
            guard mapS[s[i]] == mapT[t[i]] else { return false }
            mapS[s[i]] = i
            mapT[t[i]] = i
        }
        
        return true
    }
}

let s = Solution()

s.isIsomorphic("egg", "add")
s.isIsomorphic("foo", "bar")
s.isIsomorphic("paper", "title")
s.isIsomorphic("badc", "baba")

class Solution2 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var s = Array(s), t = Array(t)
        var mapS = [Character: Character]()
        var mapT = [Character: Character]()
        
        for i in 0..<s.count {
            mapS[s[i]] = mapS[s[i]] ?? Character("\(i)")
            mapT[t[i]] = mapT[t[i]] ?? Character("\(i)")
            
            s[i] = mapS[s[i]]!
            t[i] = mapT[t[i]]!
        }
        
        return s == t
    }
}

let s2 = Solution2()

s2.isIsomorphic("egg", "add")
s2.isIsomorphic("foo", "bar")
s2.isIsomorphic("paper", "title")
s2.isIsomorphic("badc", "baba")
