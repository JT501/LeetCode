/*:
 ## Stack, Intervals
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        func isOverlap(_ a: [Int], _ b: [Int]) -> Bool {
            a[0] <= b[1] && b[0] <= a[1]
        }

        var stack = [newInterval]
        var length = intervals.count

        for i in 0..<length {
            let curr = stack.last!
            // If overlap
            if isOverlap(curr, intervals[i]) {
                stack.removeLast()
                stack.append([min(curr[0], intervals[i][0]), max(curr[1], intervals[i][1])])
            // If larger
            } else if curr[0] > intervals[i][1] {
                stack.removeLast()
                stack.append(intervals[i])
                stack.append(curr)
            // If smaller
            } else {
                stack.append(contentsOf: intervals[i...])
                break
            }
        }

        return stack
    }
}
