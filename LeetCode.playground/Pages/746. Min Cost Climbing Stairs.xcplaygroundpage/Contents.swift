class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = [Int](repeating: .max, count: cost.count)
        (dp[0], dp[1]) = (cost[0], cost[1])
        
        for i in 2..<cost.count {
            dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])
        }
        
        return min(dp[cost.count - 1], dp[cost.count - 2])
    }
}

let s = Solution()

s.minCostClimbingStairs([10, 15, 20])
s.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])

class Solution2 {
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

let s2 = Solution2()

s2.minCostClimbingStairs([10, 15, 20])
s2.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])
