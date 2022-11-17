/*:
 ## Binary Search
 ### Time: O(log N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1
        
        while start <= end {
            let mid = start + (end - start) / 2
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] > target {
                end = mid - 1
            }
            
            if nums[mid] < target {
                start = mid + 1
            }
        }
        
        return start
    }
}

let s = Solution()

s.searchInsert([1,3,5,6], 5)
s.searchInsert([1,3,5,6], 2)
s.searchInsert([1,3,5,6], 7)
s.searchInsert([1,3], 2)
s.searchInsert([1], 2)
