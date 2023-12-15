/*:
 ## Intervals,
 ### Time: O(n ㏒n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var length = intervals.count
        var starts = intervals.map { $0[0] }
        var ends = intervals.map { $0[1] }
        var room = 0
        
        starts.sort()
        ends.sort()

        var endIdx = 0
        for i in 0..<length {
            if starts[i] < ends[endIdx] {
                room += 1
            } else {
                endIdx += 1
            }
        }

        return room
    }
}
