/*:
 ### Time: O(1)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        var overlap = 0
        
        // if a overlaps b or vice versa, calculate the overlap area
        if (bx1...bx2).overlaps(ax1...ax2) && (by1...by2).overlaps(ay1...ay2) {
            var newx1 = max(ax1, bx1)
            var newx2 = min(ax2, bx2)
            var newy1 = max(ay1, by1)
            var newy2 = min(ay2, by2)
            
            overlap = (newx2 - newx1) * (newy2 - newy1)
        }
        
        return (ax2 - ax1) * (ay2 - ay1) + (bx2 - bx1) * (by2 - by1) - overlap
    }
}

let s = Solution().computeArea

s(-3,0,3,4,0,-1,9,2)
s(-2,-2,2,2,-2,-2,2,2)
s(-2,-2,2,2,3,3,4,4)
s(-2,-2,2,2,-1,-1,1,1)
s(-2,-2,2,2,-1,4,1,6)
