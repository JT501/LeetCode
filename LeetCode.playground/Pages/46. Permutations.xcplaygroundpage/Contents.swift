/*:
 ## Backtracking
 ### Time: O(N*N!)
 ### Space: O(N!)
 ![submission](1.png)
 */
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var nums = nums
        var comb = [Int]()
        
        func backtracking(length: Int) {
            if comb.count == length {
                result.append(comb)
                return
            }
            
            for num in nums {
                comb.append(num)
                nums.removeFirst()
                backtracking(length: length)
                
                comb.removeLast()
                nums.append(num)
            }
        }
        
        backtracking(length: nums.count)
        
        return result
    }
}

let s = Solution()

s.permute([1,2,3])
s.permute([0, 1])
s.permute([1])
