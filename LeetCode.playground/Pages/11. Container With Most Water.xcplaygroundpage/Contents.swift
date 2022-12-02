/*:
 ## Two Pointers
 ### Time: O(N)
 ### Space: O(1)
 */
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var area = 0
        
        while left < right {
            area = max(min(height[left], height[right]) * (right - left), area)
            
            if height[left] <= height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return area
    }
}

let s = Solution().maxArea

s([1,8,6,2,5,4,8,3,7])
s([1,1])
