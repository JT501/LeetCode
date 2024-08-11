/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(n²)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        // Every num is at least 1 letter long
        var dp = Array(repeating: 1, count: nums.count)

        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }

        return dp.max() ?? 1
    }
}

/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(n²)
 ### Space: O(1)
 ![submission](2.png)
 */

class Solution2 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var memo = Array(repeating: 0, count: nums.count)

        func f(i: Int) -> Int {
            if memo[i] != 0 {
                return memo[i]
            }
            memo[i] = 1

            for j in (1..<i) {
                let fj = f(i: j)

                if nums[i] > nums[j] {
                    memo[i] = max(memo[i], fj + 1)
                }
            }
            return memo[i]
        }

        f(i: nums.count)

        return memo.max() ?? 1
    }
}
