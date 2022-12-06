/*:
 ## Backtracking
 ### Time: O(N*2^N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var comb = [Int]()
        var nums = nums
        var ans = [[Int]]()
        
        func backtracking(_ start: Int) {
            ans.append(comb)
            
            if start <= nums.count - 1 {
                for i in start...nums.count-1 {
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

let s = Solution().subsets

s([1,2,3])
