import Foundation

/*:
 ## Breadth First Search
 */

class Solution {
    func numSquares(_ n: Int) -> Int {
        // Set has better performance than array
        var visited: Set<Int> = []
        var perfectSquares = [Int]()
        var queue: [Int] = []
        var step = 0
        
        for i in 1...n where i*i <= n {
            perfectSquares.append(i*i)
        }
        
        if n == perfectSquares.last {
            return 1
        }
        
        queue.append(0)
        visited.insert(0)
        
        while !queue.isEmpty {
            let size = queue.count
            step += 1
            
            for _ in 0..<size {
                let current = queue.removeFirst()
                
                for ps in perfectSquares {
                    let sum = current + ps
                    
                    if sum == n {
                        return step
                    } else if sum > n {
                        break
                    } else if !visited.contains(sum) {
                        visited.insert(sum)
                        queue.append(sum)
                    }
                }
            }
        }
        
        return 0
    }
}

let s = Solution()

//s.numSquares(4)
s.numSquares(12)
s.numSquares(7168)


/*:
 ## DP
 */

class Solution2 {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(Array(repeating: Int.max, count: n+1))
        dp[0] = 0
        
        for i in 1...n {
            for j in 1...n where j*j <= i {
                dp[i] = min(dp[i], dp[i - j*j] + 1)
            }
        }
        
        return dp[n]
    }
}

let s2 = Solution2()

//s2.numSquares(4)
s2.numSquares(12)
s2.numSquares(7168)


/*:
 ## Mathematic
 ### Lagrange's Four Square theorem: there are only 4 possible results: 1, 2, 3, 4.
 ![submission](3.png)
 */

class Solution3 {
    func numSquares(_ n: Int) -> Int {
        var n = n
        
        if isSquare(n) { return 1 }
        
        // Check whether n = a^2 + b^2
        let s = Int(sqrt(Double(n)))
        for i in 1...s {
            if isSquare(n - i*i) {
                return 2
            }
        }
        
        // The result is 4 if and only if n can be written in the
        // form of 4^k*(8*m + 7). Please refer to
        // Legendre's three-square theorem.
        while n % 4 == 0 {
            n /= 4
        }
        
        if n % 8 == 7 { return 4 }
        
        return 3
    }
    
    private func isSquare(_ int: Int) -> Bool {
        let s = Int(sqrt(Double(int)))
        
        return int - s * s == 0
    }
}

let s3 = Solution3()

//s3.numSquares(4)
s3.numSquares(12)
s3.numSquares(7168)
