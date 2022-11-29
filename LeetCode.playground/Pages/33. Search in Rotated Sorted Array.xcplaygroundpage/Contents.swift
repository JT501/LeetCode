/*:
 ## Binary Search
 ### Time: O(log N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1
        
        while start <= end {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[mid] > target {
                if nums[mid] >= nums[start] && nums[start] > target {
                    start = mid + 1
                } else  {
                    end = mid - 1
                }
            } else {
                if nums[mid] <= nums[end] && nums[end] < target {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            }
        }
        
        return -1
    }
}

let s = Solution().search

s([4,5,6,7,0,1,2], 0)
s([4,5,6,7,0,1,2], 3)
s([1], 0)
s([4,5,6,7,8,1,2,3], 8)
s([4,5,6,7,8,9,1,2,3], 2)
s([5,1,2,3,4], 1)
s([8,9,2,3,4], 9)
