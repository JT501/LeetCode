/*:
 ## Hashtable
 ### Time: O(N*log N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var losers = [Int: Int]()
        var ans1 = Set<Int>()
        var ans2 = Set<Int>()
        
        for match in matches {
            losers[match[1], default: 0] += 1
            
            if losers[match[0], default: 0] == 0 {
                ans1.insert(match[0])
            } else {
                ans1.remove(match[0])
            }
            if losers[match[1]] == 1 {
                ans1.remove(match[1])
                ans2.insert(match[1])
            } else {
                ans2.remove(match[1])
            }
        }
        
        return [ans1.sorted(), ans2.sorted()]
    }
}

let s = Solution().findWinners

s([[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]])
s([[2,3],[1,3],[5,4],[6,4]])
