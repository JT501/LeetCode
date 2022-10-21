import Foundation

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var counter: [Int : Int] = [:]
        
        for num in nums { counter[num, default: 0] += 1 }
        
        var comb: [Int] = []
        
        func backtrack(length: Int) {
            if comb.count == length {
                result.append(comb)
                return
            }
            
            for (num, count) in counter {
                if count == 0 {
                    continue
                }
                comb.append(num)
                counter[num]! -= 1
                
                // Deeper
                backtrack(length: length)
                
                // Dead End
                comb.removeLast()
                counter[num]! += 1
            }
        }

        
        backtrack(length: nums.count)
        
        return result
    }
}

let s = Solution()

s.permuteUnique([1,1,2])
s.permuteUnique([1,2])
s.permuteUnique([2,2,5,5])
