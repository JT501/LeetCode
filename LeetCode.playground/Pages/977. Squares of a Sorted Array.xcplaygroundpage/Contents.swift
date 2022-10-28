class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var start = 0
        var end = nums.count - 1
        var res = [Int]()
        while start <= end {
            let sqrStart = nums[start] * nums[start]
            let sqrEnd = nums[end] * nums[end]
            
            if sqrStart > sqrEnd {
                res.insert(sqrStart, at: 0)
                start += 1
            } else {
                res.insert(sqrEnd, at: 0)
                end -= 1
            }
        }
        
        return res
    }
}

let s = Solution()

//s.sortedSquares([-4,-1,0,3,10])
//s.sortedSquares([-7,-3,2,3,11])
s.sortedSquares([-10000,-9999,-7,-5,0,0,10000])
