/*:
 ## Dynamic Programming (Bottom Up + Space Optimized)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func tribonacci(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 || n == 2 { return 1 }
        
        var prev1 = 1, prev2 = 1, prev3 = 0
        
        for _ in 3...n {
            let temp1 = prev1
            let temp2 = prev2
            prev1 = prev3 + prev2 + prev1
            prev3 = temp2
            prev2 = temp1
        }
        
        return prev1
    }
}

let s = Solution().tribonacci

s(25)

/*:
 ## Dynamic Programming (Bottom Up)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func tribonacci(_ n: Int) -> Int {
        var memo = Array(repeating: -1, count: n < 2 ? 3 : n+1)
        memo[0] = 0
        memo[1] = 1
        memo[2] = 1
        
        guard n > 2 else { return memo[n] }
        
        for i in 3...n {
            memo[i] = memo[i-3] + memo[i-2] + memo[i-1]
        }
        
        return memo[n]
    }
}

let s2 = Solution2().tribonacci

s2(0)

/*:
 ## Dynamic Programming (Top Down)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func tribonacci(_ n: Int) -> Int {
        var memo = Array(repeating: -1, count: n+1)

        func getTribonacci(_ i: Int) -> Int {
            if i == 0 {
                return 0
            }
            if i == 1 || i == 2 {
                return 1
            }
            if memo[i] != -1 {
                return memo[i]
            }
            memo[i] = getTribonacci(i-3) + getTribonacci(i-2) + getTribonacci(i-1)

            return memo[i]
        }

        return getTribonacci(n)
    }
}
