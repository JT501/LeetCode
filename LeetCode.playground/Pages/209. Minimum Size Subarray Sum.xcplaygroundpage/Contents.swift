/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var start = 0
        var sum = 0
        var minimum = 0
        
        for end in 0..<nums.count {
            sum += nums[end]
            
            while sum >= target {
                minimum = min(minimum == 0 ? Int.max : minimum, end - start + 1)
                if minimum == 1 {
                    return minimum
                }
                sum -= nums[start]
                start += 1
            }
        }
        
        return minimum
    }
}

let s = Solution()

s.minSubArrayLen(7, [2,3,1,2,4,3])
s.minSubArrayLen(4, [1,4,4])
s.minSubArrayLen(11, [1,1,1,1,1,1,1,1])
