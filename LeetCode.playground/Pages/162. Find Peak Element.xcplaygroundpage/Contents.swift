/*:
 ## Binary Search
 ### Time: O(log N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var start = 0, end = nums.count - 1
        
        while start < end {
            let mid = start + (end - start) / 2
            
            if nums[mid] > nums[mid + 1] {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return start
    }
}

let s = Solution().findPeakElement

s([1,2,3,1])
s([1,2,1,3,5,6,4])
