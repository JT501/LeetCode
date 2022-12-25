/*:
 ## Prefix Sum + Binary Search
 ### Time: O((M+N)*㏒N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var preSum = nums.sorted()
        var ans = Array(repeating: 0, count: queries.count)
        
        if nums.count > 1 {
            for i in 1..<nums.count {
                preSum[i] += preSum[i-1]
            }
        }
        
        for (i, query) in queries.enumerated() {
            ans[i] = binarySearch(0, preSum.count - 1, query)
        }
        
        func binarySearch(_ start: Int, _ end: Int, _ target: Int) -> Int {
            if end <= start {
                return preSum[start] > target ? start : start + 1
            }
            
            let mid = start + (end - start) / 2
            
            if preSum[mid] == target {
                return mid + 1
            } else if preSum[mid] > target {
                return binarySearch(start, mid - 1, target)
            } else {
                return binarySearch(mid + 1, end, target)
            }
        }
        
        return ans
    }
}

let s = Solution2().answerQueries

s([4,5,2,1], [3,10,21])

/*:
 ### Time: O(M*N + N*㏒N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var ans = [Int]()
        
        for query in queries {
            var sum = 0, size = 0, i = 0
            while sum < query, i < nums.count {
                sum += sortedNums[i]
                if sum <= query {
                    size += 1
                }
                i += 1
            }
            ans.append(size)
        }
        
        return ans
    }
}

let s2 = Solution2().answerQueries

s2([4,5,2,1], [3,10,21])
