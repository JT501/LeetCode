/*:
 ## Dynamic Programming (Bottom-Up + Space Optimized)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var prev1 = cost[1], prev2 = cost[0]
        
        for i in 2..<cost.count {
            let temp = prev1
            prev1 = cost[i] + min(prev1, prev2)
            prev2 = temp
        }
        
        return min(prev1, prev2)
    }
}

/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = [Int](repeating: .max, count: cost.count)
        (dp[0], dp[1]) = (cost[0], cost[1])
        
        for i in 2..<cost.count {
            dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])
        }
        
        return min(dp[cost.count - 1], dp[cost.count - 2])
    }
}

let s2 = Solution2()

s2.minCostClimbingStairs([10, 15, 20])
s2.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])

/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: -1, count: cost.count)
        
        func minCost(i: Int) -> Int {
            if i >= cost.count {
                return 0
            }
            if dp[i] >= 0 {
                return dp[i]
            }
            
            dp[i] = cost[i] + min(minCost(i: i + 1), minCost(i: i + 2))
            
            return dp[i]
        }
        
        return min(minCost(i: 0), minCost(i: 1))
    }
}

let s3 = Solution3()

s3.minCostClimbingStairs([10, 15, 20])
s3.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
