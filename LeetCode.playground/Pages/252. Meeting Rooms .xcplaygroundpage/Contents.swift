/*:
 ## Intervals
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        var length = intervals.count

        guard length > 0 else { return true }

        var sorted = intervals.sorted(by: { $0[0] < $1[0] })

        for i in 0..<length-1 {
            if sorted[i+1][0] < sorted[i][1] {
                return false
            }
        }

        return true
    }
}
