/*:
 ## Greedy, Intervals
 ### Time: O(n ㏒n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sorted = intervals.sorted(by: { $0[1] < $1[1] })
        var endTime = Int.min
        var ans = 0

        for i in sorted {
            if i[0] >= endTime {
                endTime = i[1]
            } else {
                ans += 1
            }
        }

        return ans
    }
}

/*:
 ## Dynamic Progamming (Memoization), Intervals - TLE
 ### Time: O(n!)
 ### Space: O(n)
 */
class Solution2 {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sorted = intervals.sorted(by: { $0[0] < $1[0] })

        func isOverlap(_ a: [Int], _ b: [Int]) -> Bool {
            a[0] < b[1] && b[0] < a[1]
        }

        var dp: [[Int]: Int] = [:]

        func compare(a: Int, b: Int) -> Int {
            if a >= sorted.count || b >= sorted.count {
                return 0
            }
            
            if dp[[a,b]] != nil {
                return dp[[a,b], default: 0]
            }

            if isOverlap(sorted[a], sorted[b]) {
                dp[[a,b], default: 0] += 1
                dp[[a,b], default: 0] += min(compare(a: a, b: b+1), compare(a: b, b: b+1))
            } else {
                dp[[a,b], default: 0] += compare(a: b, b: b+1)
            }
            return dp[[a,b], default: 0]
        }

        return compare(a: 0, b: 1)
    }
}

/*:
 ## Dynamic Progamming (Recursion), Intervals - TLE
 ### Time: O(n!)
 ### Space: O(n)
 */
class Solution3 {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sorted = intervals.sorted(by: { $0[0] < $1[0] })

        func isOverlap(_ a: [Int], _ b: [Int]) -> Bool {
            a[0] < b[1] && b[0] < a[1]
        }

        func compare(a: Int, b: Int) -> Int {
            var number = 0
            if a >= sorted.count || b >= sorted.count {
                return number
            } else {
                if isOverlap(sorted[a], sorted[b]) {
                    number += 1
                    number += min(compare(a: a, b: b+1), compare(a: b, b: b+1))
                } else {
                    number += compare(a: b, b: b+1)
                }
            }
            return number
        }

        return compare(a: 0, b: 1)
    }
}

let s3 = Solution3().eraseOverlapIntervals

s3([[1,2],[2,3],[3,4],[1,3]])
s3([[1,2],[1,2],[1,2]])
