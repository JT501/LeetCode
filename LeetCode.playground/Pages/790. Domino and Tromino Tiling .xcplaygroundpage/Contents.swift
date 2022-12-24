/*:
 ## Dynamic Programming
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func numTilings(_ n: Int) -> Int {
        let mod = Int(10e8 + 7)
        var ways = Array(repeating: 0, count: 4)
        
        ways[0] = 1
        ways[1] = 1
        ways[2] = 2
        
        if (n < 3) {
            return ways[n]
        }
        
        for i in 3...n {
            ways[i % 4] = (ways[(4 + i - 1) % 4] * 2 + ways[(4 + i - 3) % 4]) % mod
        }
        
        return ways[(n) % 4]
    }
}

let s = Solution().numTilings

s(5)
