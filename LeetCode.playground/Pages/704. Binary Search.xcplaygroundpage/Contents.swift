class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        func findKth(start: Int, end: Int) -> Int {
            guard 0..<nums.count ~= start && 0..<nums.count ~= end else { return -1}
            
            if start == end {
                if nums[start] == target {
                    return start
                } else {
                    return -1
                }
            }
            
            let mid = start + (end - start) / 2
            
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] < target {
                return findKth(start: mid + 1, end: end)
            }
        
            if nums[mid] > target {
                return findKth(start: start, end: mid - 1)
            }
            
            return -1
        }
        
        return findKth(start: 0, end: nums.count - 1)
    }
}

let s = Solution()

s.search([-1, 0, 3, 5, 9, 12], 9)
s.search([8], 8)
s.search([-1, 0, 3, 7, 10, 14, 15], 14)
