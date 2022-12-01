/*:
 ## Two Pointers
 ### Time: O(N²)
 ### Space: O(log N)
 ![submission](1.png)
 */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var nums = nums.sorted()
        
        for (i, num) in nums.enumerated() {
            guard i < nums.count - 2 else { break }
            if i > 0, num == nums[i-1] { continue }
            
            var left = i+1, right = nums.count - 1
            let target = 0 - num
            
            while left < right {
                let sum = nums[left] + nums[right]
                if sum == target {
                    ans.append([num, nums[left], nums[right]])
                    right -= 1
                    left += 1
                } else if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        
        return ans
    }
}

let s = Solution().threeSum

s([-1,0,1,2,-1,-4])
s([0,1,1])
s([0,0,0])
