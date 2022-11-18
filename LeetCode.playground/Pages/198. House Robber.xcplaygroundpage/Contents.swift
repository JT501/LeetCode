/*:
 ## Dynamic Programming (Bottom Up)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var prev1 = 0
        var prev2 = nums[0]
        
        for i in 1..<nums.count {
            let temp = prev2
            prev2 = max(prev2, prev1 + nums[i])
            prev1 = temp
        }
        
        return prev2
    }
}

let s = Solution().rob

s([1,2,3,1])
s([2,7,9,3,1])
s([0])
s([2,1,1,2])
s([2,1,1,2,8,3,1,9])
s([3,9,11,1,1,3,8])
s([3,9,11,1,1,3,8,3,3,4,8,6,7,8,2])

/*:
 ## Dynamic Programming (Bottom Up) + Memo
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var memo = Array(repeating: -1, count: nums.count + 1)
        memo[0] = 0
        memo[1] = nums[0]
        
        for i in 1..<nums.count {
            memo[i + 1] = max(memo[i], memo[i - 1] + nums[i])
        }
        
        return memo[nums.count]
    }
}

let s2 = Solution2().rob

s2([1,2,3,1])
s2([2,7,9,3,1])
s2([0])
s2([2,1,1,2])
s2([2,1,1,2,8,3,1,9])
s2([3,9,11,1,1,3,8])
s2([3,9,11,1,1,3,8,3,3,4,8,6,7,8,2])

/*:
 ## Dynamic Programming (Top Down) + Memo
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func rob(_ nums: [Int]) -> Int {
        var memo = Array(repeating: -1, count: nums.count)

        func rob(_ n: Int) -> Int {
            if n < 0 {
                return 0
            }
            if memo[n] >= 0 {
                return memo[n]
            } else {
                memo[n] = max(rob(n - 2) + nums[n], rob(n - 1))
                return memo[n]
            }
        }
        
        return rob(nums.count - 1)
    }
}

let s3 = Solution3().rob

s3([1,2,3,1])
s3([2,7,9,3,1])
s3([0])
s3([2,1,1,2])
s3([2,1,1,2,8,3,1,9])
s3([3,9,11,1,1,3,8])
s3([3,9,11,1,1,3,8,3,3,4,8,6,7,8,2])
