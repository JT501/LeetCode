/*:
 ## Binary Search
 ### Time: O(n*㏒ n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        
        func possible(_ capacity: Int) -> Bool {
            var currLoad = 0, daysNeeded = 1
            for weight in weights {
                currLoad += weight
                if currLoad > capacity {
                    daysNeeded += 1
                    currLoad = weight
                }
            }

            return daysNeeded <= days
        }

        var totalLoad = 0, maxLoad = 0
        for weight in weights {
            totalLoad += weight
            maxLoad = max(maxLoad, weight)
        }
        
        var low = maxLoad, hi = totalLoad
        
        while low < hi {
            let mid = low + (hi - low) / 2
            
            if possible(mid) {
                hi = mid
            } else {
                low = mid + 1
            }
        }

        return low
    }
}

let s = Solution().shipWithinDays

s([1,2,3,4,5,6,7,8,9,10], 5)
s([3,2,2,4,1,4], 3)
s([1,2,3,1,1], 4)
