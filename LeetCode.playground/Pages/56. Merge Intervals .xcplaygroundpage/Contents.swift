/*:
 ## Stack, Intervals
 ### Time: O(n㏒n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals
        var ans = [[Int]]()
        
        guard intervals.count > 1 else { return intervals }
        
        // sort the intervals
        intervals = intervals.sorted(by: { $0[0] < $1[0] })
        
        var i = 1
        ans.append(intervals[0])
        while i < intervals.count {
            var curr = ans.last!
            // If overlap
            if curr[0] <= intervals[i][1] && intervals[i][0] <= curr[1] {
                // Merge
                let merged = [min(intervals[i][0], curr[0]), max(intervals[i][1], curr[1])]
                ans.removeLast()
                ans.append(merged)
            } else {
                ans.append(intervals[i])
            }
            i += 1
        }

        return ans
    }
}
