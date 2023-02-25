/*:
 ## Greedy
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var lowest = Int.max
        var maxP = 0
        
        for price in prices {
            lowest = min(lowest, price)
            maxP = max(maxP, price - lowest)
        }
        
        return maxP
    }
}

let s = Solution().maxProfit

s([7,1,5,3,6,4])
s([7,6,4,3,1])

/*:
 ## Brute Force (TLE)
 ### Time: O(N²)
 ### Space: O(1)
 */
class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var maxProfit = 0
        
        for i in 0...prices.count-2 {
            let price = prices[i]
            for j in i+1...prices.count-1 {
                maxProfit = max(maxProfit, prices[j] - price)
            }
        }
        
        return maxProfit
    }
}

let s2 = Solution2().maxProfit

s2([7,1,5,3,6,4])
s2([7,6,4,3,1])
