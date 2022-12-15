/*:
 ## Dynamic Programming (Bottom-Up + Space Optimized)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        
        var prev1 = 2
        var prev2 = 1
        
        for _ in 3...n {
            let temp = prev1
            prev1 = prev1 + prev2
            prev2 = temp
        }
        
        return prev1
    }
}

let s = Solution().climbStairs

s(5)
s(38)

/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        
        var memo = Array(repeating: 0, count: n+1)

        memo[1] = 1
        memo[2] = 2
        
        for i in 3...n {
            memo[i] = memo[i-1] + memo[i-2]
        }
        
        return memo[n]
    }
}

let s2 = Solution2().climbStairs

s2(5)
s2(38)


/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution3 {
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

let s3 = Solution3()

s3.climbStairs(5)
s3.climbStairs(38)
