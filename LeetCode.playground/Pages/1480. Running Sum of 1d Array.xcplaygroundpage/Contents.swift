class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var ans = [nums.first!]
        
        for i in 1..<nums.count {
            ans.append(ans[i - 1] + nums[i])
        }
        
        return ans
    }
}
