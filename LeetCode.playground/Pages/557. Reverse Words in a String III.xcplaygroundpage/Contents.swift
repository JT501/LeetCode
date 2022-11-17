/*:
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func reverseWords(_ s: String) -> String {
        var sArr = s.components(separatedBy: " ")
        var resultArr: [String] = []
        
        for subString in sArr {
            var arr = Array(subString)
            for i in 0..<arr.count / 2 { arr.swapAt(i, arr.count - 1 - i) }
            resultArr.append(String(arr))
        }
        
        return resultArr.joined(separator: " ")
    }
}

let s = Solution()

s.reverseWords("Hello World")
s.reverseWords("Let's take LeetCode contest")

/*:
 ## Two Pointers
 ### Time: O(N*log N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func reverseWords(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        var stringArr = Array(s)
        var lastSpaceIndex = 0
        var start = 1
        var end = s.count - 1
        
        while start <= end {
            if stringArr[start] != " " {
                stringArr.insert(stringArr[start], at: lastSpaceIndex)
                stringArr.remove(at: start + 1)
            } else {
                lastSpaceIndex = start + 1
            }
            start += 1
        }
        
        return String(stringArr)
    }
}

let s2 = Solution2()

s2.reverseWords("Hello World")
s2.reverseWords("Let's take LeetCode contest")
