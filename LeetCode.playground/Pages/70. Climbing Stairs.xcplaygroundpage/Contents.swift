/*:
 ## Dynamic Programming + Memoization
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    var memo: [Int: Int] = [:]
    
    func climbStairs(_ n: Int) -> Int {
        return climb(n)
    }
    
    private func climb(_ n: Int) -> Int {
        if n <= 2 {
            return n
        } else if let val = memo[n] {
            return val
        } else {
            memo[n] = climb(n - 1) + climb(n - 2)
            return memo[n]!
        }
    }
}

let s = Solution()

s.climbStairs(5)
s.climbStairs(38)
