class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        var leftSum = 0
        
        for (i, num) in nums.enumerated() {
            if leftSum == sum - leftSum - num {
                return i
            }
            leftSum += num
        }
        
        return -1
    }
}
