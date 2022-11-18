/*:
 ## Backtracking
 ### Time: O(?)
 ### Space: O(nCk)
 ![submission](1.png)
 */
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var comb = [Int]()
        
        func backtracking(start: Int) {
            if comb.count == k {
                res.append(comb)
            } else if start <= n {
                for num in (start...n) {
                    comb.append(num)
                    
                    backtracking(start: num + 1)
                    
                    comb.removeLast()
                }
            }
        }
        
        backtracking(start: 1)
        
        return res
    }
}

let s = Solution().combine

s(4, 3)

/*:
 ## Iterative
 ### Time: O(?)
 ### Space: O(nCk)
 ![submission](2.png)
 */
class Solution2 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        var i = 0
        var comb = Array(repeating: 0, count: k)
        
        while i >= 0 {
            comb[i] += 1
            if comb[i] > n {
                i -= 1
            } else if i == k - 1 {
                res.append(comb)
            } else {
                i += 1
                comb[i] = comb[i - 1]
            }
        }
        
        return res
    }
}

let s2 = Solution2().combine

s2(4, 3)
