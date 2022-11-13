/*:
 ### Two Pointers
 ## Time: O(n)
 ## Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func reverseWords(_ s: String) -> String {
        var s = Array(s)
        var cur = s.count - 1, end = cur
        
        while cur >= 0 {
            if s[cur].isWhitespace {
                end = s.count - 1
                
                if !s.last!.isWhitespace {
                    s.insert(s.remove(at: cur), at: end)
                } else {
                    s.remove(at: cur)
                    end -= 1
                }
            } else {
                s.insert(s.remove(at: cur), at: end)
                end -= 1
            }
            cur -= 1
        }
        
        if s.last!.isWhitespace {
            s.removeLast()
        }
        
        return String(s)
    }
}

let s = Solution()

s.reverseWords("the sky is blue")
s.reverseWords("  hello world  ")
s.reverseWords("a good   example")
s.reverseWords("abs")
s.reverseWords("  abs ")

/*:
 ### No built-in function
 ## Time: O(n)
 ## Space: O(3n)
 ![submission](2.png)
 */
class Solution2 {
    func reverseWords(_ s: String) -> String {
        let s = Array(s)
        var ans = [String]()
        
        var word = [Character]()
        for (i, char) in s.enumerated() {
            if !char.isWhitespace {
                word.append(char)
            }
            if (i == s.count - 1 || char.isWhitespace) && !word.isEmpty {
                ans.append(String(word))
                word.removeAll()
            }
        }
        
        var res = ""
        for i in (0..<ans.count).reversed() {
            res += ans[i]
            if i != 0 {
                res += " "
            }
        }
        
        return res
    }
}

let s2 = Solution2()

s2.reverseWords("the sky is blue")
s2.reverseWords("  hello world  ")
s2.reverseWords("a good   example")

/*:
 ### Built-in functions
 ![submission](3.png)
 */
class Solution3 {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
}

let s3 = Solution3()

s3.reverseWords("the sky is blue")
s3.reverseWords("  hello world  ")
s3.reverseWords("a good   example")
