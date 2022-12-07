/*:
 ## Backtracking
 ### Time: O(2^N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        let len = candidates.count
        var comb = [Int]()
        var ans = [[Int]]()
        
        func backtracking(_ start: Int, _ sum: Int) {
            if sum == target {
                ans.append(comb)
                return
            }
            if sum > target {
                return
            }
            if start < len {
                for i in start..<len {
                    if i != start && candidates[i] == candidates[i-1] {
                        continue
                    }
                    comb.append(candidates[i])
                    backtracking(i+1, sum + candidates[i])
                    comb.removeLast()
                }
            }
        }
        
        backtracking(0, 0)
        
        return ans
    }
}

let s = Solution().combinationSum2

s([10,1,2,7,6,1,5], 8)

