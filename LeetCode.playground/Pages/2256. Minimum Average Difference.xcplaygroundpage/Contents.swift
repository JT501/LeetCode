/*:
 ## Prefix Sum (Space Optimized)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        var currentPrefixSum = 0
        var totalSum = 0
        var minDiff = Int.max
        var ans = -1
        
        totalSum = nums.reduce(0, +)
        
        for (i, num) in nums.enumerated() {
            currentPrefixSum += num
            
            let leftAvg = currentPrefixSum / (i+1)
            let right = totalSum - currentPrefixSum
            var diff = 0
            
            if i < nums.count-1 {
                diff = abs(leftAvg - right / (nums.count-i-1))
            } else {
                diff = abs(leftAvg)
            }
            if diff < minDiff {
                minDiff = diff
                ans = i
            }
        }
        
        return ans
    }
}

let s = Solution().minimumAverageDifference

s([2,5,3,9,5,3])
s([0])
s([1,1,1,1,1])

/*:
 ## Prefix Sum + Suffix Sum
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var prefixSum = nums
        var suffixSum = nums
        var diff = Array(repeating: 0, count: nums.count)
        var minDiff = Int.max
        var ans = -1
        
        for i in 1..<nums.count {
            prefixSum[i] = prefixSum[i - 1] + nums[i]
        }
        
        for i in (0...nums.count-2).reversed() {
            suffixSum[i] = suffixSum[i+1] + nums[i]
        }
        
        for i in 0..<nums.count {
            if i < nums.count - 1 {
                diff[i] = abs(prefixSum[i] / (i+1) - suffixSum[i+1] / (nums.count - i - 1))
            } else {
                diff[i] = abs(prefixSum[i] / (i+1))
            }
            if diff[i] < minDiff {
                minDiff = diff[i]
                ans = i
            }
        }
        
        return ans
    }
}

let s2 = Solution2().minimumAverageDifference

s2([2,5,3,9,5,3])
s2([0])
s2([1,1,1,1,1])
