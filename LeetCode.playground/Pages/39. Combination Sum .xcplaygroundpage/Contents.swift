/*:
 ## Backtracking
 ### Time: O(N^(T/M + 1)), T = Target, M = Minimal candidates
 ### Space: O(T/M)
 ![submission](1.png)
 */
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var len = candidates.count
        var comb = [Int]()
        var ans = [[Int]]()
        
        func backtracking(_ start: Int, _ sum: Int) {
            guard start < len else { return }
            
            if sum == target {
                ans.append(comb)
                return
            } else if sum > target {
                return
            }
            
            for i in start..<len {
                comb.append(candidates[i])
                backtracking(i, candidates[i] + sum)
                comb.removeLast()
            }
        }
        
        backtracking(0, 0)
        
        return ans
    }
}

let s = Solution().combinationSum

s([2,3,6,7], 7)
s([2,3,5], 8)
