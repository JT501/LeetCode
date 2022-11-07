import Foundation

class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var nums = Array("\(num)")
        for (i, num) in nums.enumerated() {
            if num == "6" {
                nums[i] = "9"
                break
            }
        }
        
        return Int(String(nums))!
    }
}

let s = Solution()

s.maximum69Number(9669)

