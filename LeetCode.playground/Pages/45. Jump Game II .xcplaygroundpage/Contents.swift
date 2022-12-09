/*:
 ## Greedy
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func jump(_ nums: [Int]) -> Int {
        var len = nums.count
        var i = 0, maxReach = 0, lastJumpIdx = 0, steps = 0
        
        while lastJumpIdx < len-1 {
            maxReach = max(maxReach, i+nums[i])
            if i == lastJumpIdx {
                lastJumpIdx = maxReach
                steps += 1
            }
            i += 1
        }
        
        return steps
    }
}

/*:
 ## Dynamic Programming (Bottom-Up)
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func jump(_ nums: [Int]) -> Int {
        var len = nums.count
        var memo = Array(repeating: 10001, count: nums.count)
        
        memo[len-1] = 0
        
        for i in (0..<len-1).reversed() {
            let farrestJump = min(nums[i]+i, len-1)
            if farrestJump == len-1 {
                memo[i] = 1
            } else {
                if i+1 <= farrestJump {
                    for j in i+1...farrestJump {
                        memo[i] = min(memo[j] + 1, memo[i])
                    }
                }
            }
        }
        
        return memo[0]
    }
}

let s2 = Solution2().jump

s2([2,3,1,1,4])
s2([2,3,0,1,4])
s2([1,2,3])

/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func jump(_ nums: [Int]) -> Int {
        var len = nums.count
        var memo = Array(repeating: Int.max, count: nums.count)
        
        func minStepFrom(_ n: Int) -> Int {
            if n == len-1 {
                memo[n] = 0
            }
            if memo[n] != Int.max {
                return memo[n]
            }
            let farrestJump = min(nums[n]+n, len-1)
            if farrestJump == len-1 {
                memo[n] = 1
            } else {
                if n+1 <= farrestJump {
                    for i in n+1...farrestJump {
                        if minStepFrom(i) == 0 { continue }
                        memo[n] = min(minStepFrom(i), memo[n])
                    }
                }
                if memo[n] == Int.max {
                    memo[n] = 0
                } else {
                    memo[n] += 1
                }
            }
            return memo[n]
        }
        
        return minStepFrom(0)
    }
}

let s3 = Solution3().jump

s3([2,3,1,1,4])
s3([2,3,0,1,4])
s3([3,2,1,0,4])
s3([1,2,3])
