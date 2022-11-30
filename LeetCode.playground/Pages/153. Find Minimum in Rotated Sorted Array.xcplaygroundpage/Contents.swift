/*:
 ## Binary Search
 ### Time: O(log N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0, end = nums.count - 1
        
        while start < end {
            let mid = start + (end - start) / 2
            
            if nums[mid] >= nums[start] && nums[mid] > nums[end] {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        return nums[start]
    }
}

let s = Solution().findMin

s([3,4,5,1,2])
s([4,5,6,7,0,1,2])
s([11,13,15,17])
s([1])
s([2,1])
