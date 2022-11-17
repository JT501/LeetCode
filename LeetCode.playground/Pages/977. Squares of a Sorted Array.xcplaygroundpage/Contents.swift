/*:
 ## Two Pointers
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var start = 0
        var end = nums.count - 1
        var res = Array(repeating: 0, count: nums.count)
        var index = nums.count - 1
        
        while start <= end, index >= 0 {
            let sqrStart = nums[start] * nums[start]
            let sqrEnd = nums[end] * nums[end]
            
            if sqrStart > sqrEnd {
                res[index] = sqrStart
                start += 1
            } else {
                res[index] = sqrEnd
                end -= 1
            }
            index -= 1
        }
        
        return res
    }
}

let s = Solution()

s.sortedSquares([-4,-1,0,3,10])
s.sortedSquares([-7,-3,2,3,11])
s.sortedSquares([-10000,-9999,-7,-5,0,0,10000])
