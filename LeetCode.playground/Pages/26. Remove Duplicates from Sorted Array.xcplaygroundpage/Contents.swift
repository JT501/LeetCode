//: ![submission](26.png)
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let len = nums.count
        guard len > 1 else { return len }
        var start = 0
        
        for num in nums where num != nums[start] {
            start += 1
            nums[start] = num
        }
        
        return start + 1
    }
}

let s = Solution()

var nums = [1,1,2]

s.removeDuplicates(&nums)
