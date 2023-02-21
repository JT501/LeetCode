/*:
 ## Binary Search
 ### Time: O(㏒ n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var min = 0, max = nums.count - 1
        
        while min < max {
            let mid = min + (max - min) / 2
            if mid - 1 >= min && nums[mid] == nums[mid - 1] {
                if (mid - 2) % 2 == 0 {
                    max = mid - 2
                } else {
                    min = mid + 1
                }
            } else if mid + 1 <= max && nums[mid] == nums[mid + 1] {
                if (mid + 2) % 2 == 0 {
                    min = mid + 2
                } else {
                    max = mid - 1
                }
            } else {
                return nums[mid]
            }
        }
        
        return nums[min]
    }
}

let s = Solution().singleNonDuplicate

s([1,1,2,3,3,4,4,8,8])
s([3,3,7,7,10,11,11])


/*:
 ## Binary Search
 ### Time: O(㏒ n)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var min = 0, max = nums.count - 1
        
        while min < max {
            var mid = min + (max - min) / 2
            if mid % 2 == 1 { mid -= 1 }
            if nums[mid] == nums[mid + 1] {
                min = mid + 2
            } else {
                max = mid
            }
        }
        
        return nums[min]
    }
}

let s2 = Solution2().singleNonDuplicate

s2([1,1,2,3,3,4,4,8,8])
s2([3,3,7,7,10,11,11])
