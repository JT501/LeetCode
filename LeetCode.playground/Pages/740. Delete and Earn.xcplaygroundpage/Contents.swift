/*:
 ## Dynamic Programming (Bottom-Up + Space Optimized)
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var hashmap = [Int: Int]()
        var end = Int.min
        
        for num in nums {
            hashmap[num, default: 0] += num
            end = max(num, end)
        }
        
        var prev1 = hashmap[1, default: 0]
        var prev2 = 0
        
        guard end >= 2 else { return prev1 }
        
        for i in 2...end {
            let temp = prev1
            prev1 = max((hashmap[i, default: 0] + prev2), prev1)
            prev2 = temp
        }
        
        return prev1
    }
}

let s = Solution().deleteAndEarn

s([3,4,2])
s([2,2,3,3,3,4])

/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var hashmap = [Int: Int]()
        var start = Int.max, end = Int.min
        
        for num in nums {
            hashmap[num, default: 0] += num
            start = min(num, start)
            end = max(num, end)
        }
        
        var memo = Array(repeating: 0, count: end + 1)
        
        memo[1] = hashmap[1, default: 0]
        
        guard end >= 2 else { return memo[1] }
        
        for i in 2...end {
            memo[i] = max((hashmap[i, default: 0] + memo[i-2]), memo[i-1])
        }
        
        return memo[end]
    }
}

let s2 = Solution2().deleteAndEarn

s2([3,4,2])
s2([2,2,3,3,3,4])
s2([1])

/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var hashmap = [Int: Int]()
        var memo = [Int: Int]()
        var start = Int.max, end = Int.min
        
        for num in nums {
            hashmap[num, default: 0] += num
            start = min(num, start)
            end = max(num, end)
        }
        
        func maxPoint(_ i: Int) -> Int {
            if i == 0 {
                return 0
            }
            if i == 1 {
                return hashmap[1, default: 0]
            }
            if memo[i] != nil {
                return memo[i]!
            }
            memo[i] = max((hashmap[i] ?? 0) + maxPoint(i-2), maxPoint(i-1))
            
            return memo[i]!
        }
        
        return maxPoint(end)
    }
}

let s3 = Solution3().deleteAndEarn

s3([3,4,2])
s3([2,2,3,3,3,4])
