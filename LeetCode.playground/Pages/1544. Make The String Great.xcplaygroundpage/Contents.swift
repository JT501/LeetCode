class Solution {
    func makeGood(_ s: String) -> String {
        var ans = [Character]()
        
        for char in s {
            if ans.isEmpty {
                ans.append(char)
                continue
            }
            if abs(Int(ans.last!.asciiValue!) - Int(char.asciiValue!)) == 32 {
                ans.removeLast()
                continue
            }
            ans.append(char)
        }
        
        return String(ans)
    }
}

let s = Solution()

s.makeGood("leEeetcode")
s.makeGood("abBAcC")
s.makeGood("s")
s.makeGood("qFxXfQo")

class Solution2 {
    func makeGood(_ s: String) -> String {
        var s = Array(s)
        var isEnd = false
        
        while !isEnd && s.count > 1 {
            var start = 0, end = s.count - 2
            
            while start <= end {
                if abs(Int(s[start].asciiValue!) - Int(s[start + 1].asciiValue!)) == 32 {
                    s.remove(at: start)
                    s.remove(at: start)
                    break
                } else if start == end {
                    isEnd = true
                }
                start += 1
            }
        }
        
        return String(s)
    }
}

let s2 = Solution2()

s2.makeGood("leEeetcode")
s2.makeGood("abBAcC")
s2.makeGood("s")
s2.makeGood("qFxXfQo")
