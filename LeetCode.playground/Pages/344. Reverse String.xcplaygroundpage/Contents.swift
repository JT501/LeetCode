/*:
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func reverseString(_ s: inout [Character]) {
        for i in 0..<s.count / 2 { s.swapAt(i, s.count - 1 - i) }
    }
}

let s = Solution()

var hello = Array("hello")

s.reverseString(&hello)


/*:
 ## Two Pointers
 ### Time: O(N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func reverseString(_ s: inout [Character]) {
        func reverse(_ start: Int, _ end: Int) {
            if (start >= end) { return }
            let tmp = s[start]
            s[start] = s[end]
            s[end] = tmp
            return reverse(start + 1, end - 1)
        }
        
        return reverse(0, s.count - 1)
    }
}
