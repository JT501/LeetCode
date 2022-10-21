import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int:Int] = [:]
        for (index, num) in nums.enumerated() {
            if let complementIndex = map[target - num] {
                return [complementIndex, index]
            }
            map[num] = index
        }
        return []
    }
}

let s = Solution()

s.twoSum([2,7,11,15], 9)
s.twoSum([3,2,4], 6)
