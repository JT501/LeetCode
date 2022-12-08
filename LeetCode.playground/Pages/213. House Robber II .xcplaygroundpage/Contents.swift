/*:
 ## Dynamic Programming (Bottom Up, Space Optimized)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var len = nums.count
        guard len > 1 else { return nums[0] }
        
        var pprev1 = nums[0]
        var prev1 = max(nums[0], nums[1])
        
        guard len > 2 else { return prev1 }
        
        for i in 2..<len-1 {
            let temp = prev1
            prev1 = max(pprev1 + nums[i], prev1)
            pprev1 = temp
        }
        
        var pprev2 = nums[1]
        var prev2 = max(nums[1], nums[2])
        
        for i in 3..<len {
            let temp = prev2
            prev2 = max(pprev2 + nums[i], prev2)
            pprev2 = temp
        }
        
        return max(prev1, prev2)
    }
}

let s = Solution().rob

s([1])
s([5,3])
s([2,3,2])
s([1,2,3,1])
s([1,2,3])
s([1,5,3,1,4])
s([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
)

/*:
 ## Dynamic Programming (Bottom Up)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var len = nums.count
        var dp1 = Array(repeating: -1, count: nums.count), dp2 = dp1
        
        dp1[0] = nums[0]
        dp1[1] = max(nums[0], nums[1])
        
        guard nums.count > 2 else { return dp1[1] }
        
        for i in 2..<len-1 {
            dp1[i] = max(dp1[i-2] + nums[i], dp1[i-1])
        }
        
        dp2[1] = nums[1]
        dp2[2] = max(nums[1], nums[2])
        
        for i in 3..<len {
            dp2[i] = max(dp2[i-2] + nums[i], dp2[i-1])
        }
        
        return max(dp1[len-2], dp2[len-1])
    }
}

let s2 = Solution2().rob

s2([1])
s2([5,3])
s2([2,3,2])
s2([1,2,3,1])
s2([1,2,3])
s2([1,5,3,1,4])
s2([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
)

/*:
 ## Dynamic Programming (Top Down)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var nums1 = nums, nums2 = nums
        nums1.removeFirst()
        nums2.removeLast()
        
        var dp1 = Array(repeating: -1, count: nums1.count), dp2 = dp1
        
        return max(maxRob(nums1.count-1, nums1, &dp1), maxRob(nums2.count-1, nums2, &dp2))
    }
    
    func maxRob(_ n: Int, _ nums: [Int], _ dp: inout [Int]) -> Int {
        if n == 0 {
            return nums[0]
        }
        if n == 1 {
            return max(nums[0], nums[1])
        }
        if dp[n] != -1 {
            return dp[n]
        }
        dp[n] = max(maxRob(n-1,nums,&dp), maxRob(n-2,nums,&dp) + nums[n])
        
        return dp[n]
    }
}

let s3 = Solution3().rob

s3([2,3,2])
s3([1,2,3,1])
s3([1,2,3])
s3([1,5,3,1,4])
s3([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
)
