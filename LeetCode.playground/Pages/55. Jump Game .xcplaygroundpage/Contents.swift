/*:
 ## Greedy
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count-1
        for i in (0..<nums.count-1).reversed() {
            if nums[i] >= (goal - i) {
                goal = i
            }
        }
        
        return goal == 0
    }
}

let s = Solution().canJump

s([2,3,1,1,4])
s([3,2,1,0,4])
s([7,0,0,0,3,0,0,4])

/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func canJump(_ nums: [Int]) -> Bool {
        let len = nums.count
        var memo = Array(repeating: false, count: len)
        
        memo[len-1] = true
        
        for i in (0..<len-1).reversed() {
            let farrestJump = min(i+nums[i], len-1)
            if i+1 <= farrestJump {
                for j in i+1...farrestJump {
                    if memo[j] == true {
                        memo[i] = true
                        break
                    }
                }
            }
        }
        
        return memo[0]
    }
}

let s2 = Solution2().canJump

s2([2,3,1,1,4])
s2([3,2,1,0,4])
s2([7,0,0,0,3,0,0,4])


/*:
 ## Dynamic Programming (Top-Down)
 ### Time: O(N²)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func canJump(_ nums: [Int]) -> Bool {
        let len = nums.count
        var memo: [Bool?] = Array(repeating: nil, count: len)
        
        func canJumpFrom(_ n: Int) -> Bool {
            if n == len-1 {
                memo[n] = true
                return memo[n]!
            }
            if let _memo = memo[n] {
                return _memo
            }
            let farrestJump = min(n + nums[n], len-1)
            if n+1 <= farrestJump {
                for next in n+1...farrestJump {
                    if canJumpFrom(next) {
                        memo[n] = true
                        return memo[n]!
                    }
                }
            }
            memo[n] = false
            return memo[n]!
        }
        
        return canJumpFrom(0)
    }
}

let s3 = Solution3().canJump

s3([2,3,1,1,4])
s3([3,2,1,0,4])
s3([7,0,0,0,3,0,0,4])
