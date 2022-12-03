/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        
        var product = 1, left = 0, ans = 0
        
        for right in 0..<nums.count {
            product *= nums[right]
            while product >= k {
                product /= nums[left]
                left += 1
            }
            ans += right - left + 1
        }
        return ans
    }
}

let s = Solution().numSubarrayProductLessThanK

s([10,5,2,6], 100)

/*:
 ## Sliding Window
 ### Time: O((N+1)*N/2)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, right = left
        var product = 1
        var ans = 0
        
        while left < nums.count {
            product *= nums[right]
            
            if product < k {
                ans += 1
            }
            
            if product >= k || right == nums.count - 1 {
                left += 1
                right = left
                product = 1
            } else {
                right += 1
            }
        }
        
        return ans
    }
}

let s2 = Solution2().numSubarrayProductLessThanK

s2([10,5,2,6], 1000)
