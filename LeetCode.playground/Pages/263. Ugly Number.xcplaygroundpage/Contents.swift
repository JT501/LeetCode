/*:
 ### Time: O(log(N))
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func isUgly(_ n: Int) -> Bool {
        var n = n
        
        for prime in [2,3,5] {
            while n > 0, n % prime == 0 {
                n /= prime
            }
        }
        
        return n == 1
    }
}

let s = Solution().isUgly

s(6)
s(1)
s(14)
s(21)
s(22)
s(15)
