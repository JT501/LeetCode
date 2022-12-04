/*:
 ## Dynamic Programming
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        
        var dp = 0
        var sum = 0
        
        for i in 2..<nums.count {
            if nums[i] - nums[i-1] == nums[i-1] - nums[i-2] {
                dp += 1
            } else {
                dp = 0
            }
            sum += dp
        }
        
        return sum
    }
}

let s = Solution().numberOfArithmeticSlices

s([1,2,3,4])
s([1,2,3,4,5])
s([3,-1,-5,-9])
s([1,2,3,4,5,6])
s([1,2,3,2,4,5,6])


/*:
 ### Time: O(N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        
        var length = 2
        var prevDiff = Int.max
        var count = 0
        
        for i in 1..<nums.count {
            let diff = nums[i] - nums[i-1]
            
            if diff != prevDiff {
                length = 2
                prevDiff = diff
            } else {
                length += 1
            }
            
            if length >= 3 {
                count += 1 + (length - 3)
            }
        }
        
        return count
    }
}

let s2 = Solution2().numberOfArithmeticSlices

s2([1,2,3,4])
s2([1,2,3,4,5])
s2([3,-1,-5,-9])
s2([1,2,3,4,5,6])
s2([1,2,3,2,4,5,6])
