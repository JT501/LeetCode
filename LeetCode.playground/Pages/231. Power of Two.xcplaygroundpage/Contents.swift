/*:
 ### Time: O(log(N))
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var n = n
        
        while n != 0, n % 2 == 0 {
            n /= 2
        }
        
        return n == 1
    }
}

let s = Solution().isPowerOfTwo

s(1)
s(16)
s(3)
s(0)

/*:
 ## Bit Manipulation
 ### Time: O(1)
 ### Space: O(1)
 */
class Solution2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        
        return (n & (n - 1)) == 0
    }
}

let s2 = Solution2().isPowerOfTwo

s2(1)
s2(16)
s2(3)
s2(0)
