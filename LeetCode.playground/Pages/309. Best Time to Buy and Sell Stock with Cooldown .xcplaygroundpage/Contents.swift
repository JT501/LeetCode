/*:
 ## Dynamic Programming + State Machine
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var sold = Int.min, held = Int.min, reset = 0
        
        for price in prices {
            let preSold = sold
            
            sold = held + price
            held = max(held, reset - price)
            reset = max(reset, preSold)
        }
        
        return max(sold, reset)
    }
}

let s = Solution().maxProfit

s([1,2,3,0,2])
s([1])
s([1,2,3,0,2,3,4])

/*:
 ## Dynamic Programming
 [Solution](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/solutions/240097/come-on-in-you-will-not-regret-most-general-java-code-like-all-other-dp-solutions/?orderBy=most_votes)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 0 else { return 0 }
        
        var memo = Array(repeating: 0, count: n)
        var maxDiff = Int.min
        
        for i in 0..<n {
            if i < 2 { maxDiff = max(maxDiff, -prices[i]) }
            if i == 0 {
                memo[0] = 0
            } else if i == 1 {
                memo[1] = max(prices[1]-prices[0], 0)
            } else {
                memo[i] = max(memo[i-1], maxDiff + prices[i])
                maxDiff = max(maxDiff, memo[i-2] - prices[i])
            }
        }
        
        return memo[n-1]
    }
}

let s2 = Solution2().maxProfit

s2([1,2,3,0,2])
s2([1])
s2([1,2,3,0,2,3,4])


/*:
 ## Dynamic Programming
 [Solution](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/solutions/240097/come-on-in-you-will-not-regret-most-general-java-code-like-all-other-dp-solutions/?orderBy=most_votes)
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 0 else { return 0 }
        
        var memo = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            if i == 0 {
                memo[0] = 0
            } else if i == 1 {
                memo[1] = max(prices[1]-prices[0], 0)
            } else {
                memo[i] = memo[i-1]
                for j in 0..<i {
                    let prev = j >= 2 ? memo[j-2] : 0
                    memo[i] = max(memo[i], prev + prices[i] - prices[j])
                }
            }
        }
        
        return memo[n-1]
    }
}

let s3 = Solution3().maxProfit

s3([1,2,3,0,2])
s3([1])
s3([1,2,3,0,2,3,4])

/*:
 ## Dynamic Programming
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](4.png)
 */
class Solution4 {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var memo = Array(repeating: 0, count: n+2)
        
        for i in (0..<n).reversed() {
            var c1 = 0
            for sell in i+1..<n {
                let profit = (prices[sell] - prices[i]) + memo[sell+2]
                c1 = max(c1, profit)
            }
            var c2 = memo[i+1]
            memo[i] = max(c1, c2)
        }
        
        return memo[0]
    }
}

let s4 = Solution4().maxProfit

s4([1,2,3,0,2])
s4([1])
s4([1,2,3,0,2,3,4])
