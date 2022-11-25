/*:
 ## Dynamic Programming + Monotonic Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var arrLength = arr.count
        var res = 0
        var dp = arr
        var stack = [Int]()
        var mod = Int(1e9 + 7)
        
        for i in 0...arrLength {
            if i == arrLength {
                res += dp.reduce(0, +)
            } else {
                while !stack.isEmpty, arr[i] < arr[stack.last!] {
                    stack.removeLast()
                }
                if stack.isEmpty {
                    dp[i] = (i + 1) * arr[i]
                } else {
                    let j = stack.last!
                    dp[i] = dp[j] + (i - j) * arr[i]
                }
                
                stack.append(i)
            }
        }
                
        return res % mod
    }
}

let s = Solution().sumSubarrayMins

s([3,1,2,4])
s([11,81,94,43,3])

/*:
 ## (Improved) Monotic Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var length = arr.count
        var res = 0
        var stack = [Int]()
        let mod = 1000000007
        
        for i in 0...length {
            if stack.isEmpty || (i < length && arr[i] > arr[stack.last!]) {
                stack.append(i)
            } else {
                while !stack.isEmpty, i == length || arr[i] < arr[stack.last!] {
                    let mid = stack.removeLast()
                    let left = stack.isEmpty ? -1 : stack.last!
                    let right = i
                    
                    let count = (mid - left) * (right - mid)
                    
                    res += (count * arr[mid])
                }
                stack.append(i)
            }
        }
        
        return res % mod
    }
}

let s2 = Solution2().sumSubarrayMins

s2([3,1,2,4])
s2([11,81,94,43,3])

/*:
 ## Monotonic Stack
 ### Time: O(N*N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var length = arr.count
        var res = 0
        var stack = [Int]()
        
        for i in 0..<length {
            mono(i)
            
            for j in (0..<stack.count).reversed() {
                if j - 1 >= 0 {
                    res += arr[stack[j]] * (stack[j] - stack[j - 1])
                } else {
                    res += arr[stack[j]] * (stack[j] + 1)
                }
            }
            
        }
        
        func mono(_ i: Int) {
            if stack.isEmpty || arr[i] > arr[stack.last!] {
                stack.append(i)
            } else {
                while !stack.isEmpty, arr[i] < arr[stack.last!] {
                    stack.removeLast()
                }
                stack.append(i)
            }
        }
        
        return res % (1000000000 + 7)
    }
}

let s3 = Solution3().sumSubarrayMins

s3([3,1,2,4])
s3([11,81,94,43,3])

/*:
 ## Dynamic Programming (TLE)
 ### Time: O(N*N!)
 ### Space: O(N)
 */
class Solution4 {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var arrLength = arr.count
        var length = 1
        var res = 0
        var dp = arr
        
        while length <= arrLength {
            for i in 0...(arrLength - length) {
                if length > 1 {
                    dp[i] = min(dp[i], dp[i + 1])
                }
                res += dp[i]
            }
            length += 1
        }
                
        return res % (1000000000 + 7)
    }
}

let s4 = Solution4().sumSubarrayMins

s4([3,1,2,4])
s4([11,81,94,43,3])
