/*:
 ## Backtracking
 ### Time: O(N*2^N)
 ### Space: O(N)
 */
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var comb = [Int]()
        var ans = [[Int]]()
        var len = nums.count

        func backtracking(_ start: Int) {
            ans.append(comb)
            
            if start < len {
                for i in start..<len {
                    if i != start && nums[i] == nums[i-1] {
                        continue
                    }
                    
                    comb.append(nums[i])
                    
                    backtracking(i+1)
                    
                    comb.removeLast()
                }
            }
        }
        
        backtracking(0)
        
        return ans
    }
}

let s = Solution().subsetsWithDup

s([1,2,2])
s([0])
s([4,4,4,1,4])

/*
 ## Cascading
 ### Time: O(N*2^N)
 ### Space: O(log N)
 */
class Solution2 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var ans: [[Int]] = [[]]
        
        var subsetSize = 0
        
        for i in 0..<nums.count {
            let start = (i >= 1 && nums[i] == nums[i-1]) ? subsetSize : 0
            
            subsetSize = ans.count
            
            for j in start..<subsetSize {
                var currentSubset = ans[j]
                currentSubset.append(nums[i])
                ans.append(currentSubset)
            }
        }

        return ans
    }
}

let s2 = Solution2().subsetsWithDup

s2([1,2,2])
s2([0])
s2([4,4,4,1,4])
