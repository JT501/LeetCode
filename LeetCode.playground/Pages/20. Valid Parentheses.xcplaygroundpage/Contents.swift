import Foundation

/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        
        var characters = [Character]()
        let open: [Character] = ["(", "[", "{"]
        let close: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
        
        for c in s {
            if open.contains(c) {
                characters.append(c)
                continue
            }
            
            if let last = characters.last, c == close[last] {
                characters.removeLast()
            } else {
                return false
            }
        }
        
        return characters.isEmpty
    }
}

let s = Solution().isValid

s("((")
s("()")
s("()[]{}")
s("(]")
s("(([[]])){}")
s("([)]")
s("(([]))")
s("(())[]")

/*:
 ## Recursive
 */
class Solution2 {
    func isValid(_ s: String) -> Bool {
        let s = Array(s)
        var done = Set<Int>()
        let open: [Character] = ["(", "[", "{"]
        let close: [Character: Character] = ["(": ")", "[": "]", "{": "}"]

        guard s.count % 2 == 0 else { return false }
        guard let firstChar = s.first, open.contains(firstChar) else { return false }

        var opens = [Int]()

        // Check all open brackets
        for (i, c) in s.enumerated() {
            if open.contains(c) {
                opens.append(i)
            }
        }

        // If open brackets not half of string, return false
        if opens.count != s.count / 2 {
            return false
        }

        // Recursively check the brackets
        func check(end: Int) -> Bool {
            guard end < s.count else { return false }

            let start = opens.last!
            var end = end

            if s[end] == close[s[start]] {
                done.insert(start)
                done.insert(end)
                opens.removeLast()

                if opens.isEmpty {
                    return true
                }

                end = opens.last! + 1
                while done.contains(end) {
                    end += 1
                }

                return check(end: end)
            }

            return false
        }

        return check(end: opens.last! + 1)
    }
}

let s2 = Solution2().isValid

s2("((")
s2("()")
s2("()[]{}")
s2("(]")
s2("(([[]])){}")
s2("([)]")
s2("(([]))")
s2("(())[]")
