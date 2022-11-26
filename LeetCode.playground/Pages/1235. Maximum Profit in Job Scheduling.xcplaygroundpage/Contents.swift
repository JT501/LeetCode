/*:
 ## Dynamic Programming (Top-Down) + Binary Search
 ### Time: O(N*log N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        var dp = Array(repeating: -1, count: startTime.count + 1)
        var jobs = startTime
            .enumerated()
            .map{ ($0.element, endTime[$0.offset], profit[$0.offset])}
            .sorted(by: { $0.0 < $1.0 })
        
        func findMax(_ position: Int) -> Int {
            if position >= jobs.count {
                return 0
            }
            if dp[position] != -1 {
                return dp[position]
            }
            
            let nextIndex = binarySearch(jobs[position].1)
            
            dp[position] = max(findMax(position + 1), jobs[position].2 + findMax(nextIndex))
            
            return dp[position]
        }
        
        func binarySearch(_ lastEndingTime: Int) -> Int {
            var start = 0, end = jobs.count - 1, nextIndex = jobs.count
            
            while start <= end {
                let mid = start + (end - start) / 2
                if jobs[mid].0 >= lastEndingTime {
                    nextIndex = mid
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            }
            
            return nextIndex
        }
            
        return findMax(0)
    }
}

let s = Solution().jobScheduling

s([1,2,3,3], [3,4,5,6], [50,10,40,70])
s([1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60])
s([4,2,4,8,2], [5,5,5,10,8], [1,2,8,10,4])
