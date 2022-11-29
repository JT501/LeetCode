/*:
 ## Binary Search
 ### Time: O(log N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [search(nums, target, true), search(nums, target, false)]
    }
    
    func search(_ nums: [Int], _ target: Int, _ isFirst: Bool) -> Int {
        var start = 0, end = nums.count - 1, index = -1
        
        while start <= end {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                index = mid
                if isFirst {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else if nums[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return index
    }
}

let s = Solution().searchRange

s([5,7,7,8,8,10], 8)
s([5,7,7,8,8,10], 6)
s([], 0)
s([1], 0)
s([2,2], 3)
