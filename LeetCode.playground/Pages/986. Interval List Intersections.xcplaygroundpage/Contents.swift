/*:
 ## Two Pointers
 ### Time: O(max(M,N))
 ### Space: O(M + N)
 ![submission](1.png)
 */
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        guard firstList.count > 0 && secondList.count > 0 else { return [] }
        
        var i = 0, j = 0
        var ans = [[Int]]()
        
        while i < firstList.count && j < secondList.count {
            let firstStart = firstList[i][0]
            let firstEnd = firstList[i][1]
            let secondStart = secondList[j][0]
            let secondEnd = secondList[j][1]
            
            let lo = max(firstStart, secondStart)
            let hi = min(firstEnd, secondEnd)
            
            if lo <= hi {
                ans.append([lo, hi])
            }
            
            if secondEnd > firstEnd {
                i += 1
            } else {
                j += 1
            }
        }
        
        return ans
    }
}

let s = Solution().intervalIntersection

s([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]])
s([[1,3],[5,9]], [])
s([[3,5],[9,20]], [[4,5],[7,10],[11,12],[14,15],[16,20]])


/*:
 ## Two Pointers
 ### Time: O(max(M,N))
 ### Space: O(M + N)
 ![submission](2.png)
 */
class Solution2 {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        guard firstList.count > 0 && secondList.count > 0 else { return [] }
        
        var i = 0, j = 0
        var ans = [[Int]]()
        
        while i < firstList.count && j < secondList.count {
            let firstStart = firstList[i][0]
            let firstEnd = firstList[i][1]
            let secondStart = secondList[j][0]
            let secondEnd = secondList[j][1]
            
            if (firstStart...firstEnd).overlaps(secondStart...secondEnd) {
                ans.append([max(firstStart, secondStart), min(firstEnd, secondEnd)])
            }
            
            if firstEnd > secondEnd {
                j += 1
            } else {
                i += 1
            }
        }
        
        return ans
    }
}

let s2 = Solution2().intervalIntersection

s2([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]])
s2([[1,3],[5,9]], [])
s2([[3,5],[9,20]], [[4,5],[7,10],[11,12],[14,15],[16,20]])
