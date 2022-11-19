/*:
 ![submission](1.png)
 */
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, counter = 0
        
        while n != 0 {
            counter += n % 2
            n /= 2
        }
        
        return counter
    }
}

/*:
 ## Bit Manipulation
 ![submission](2.png)
 */
class Solution2 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, counter = 0
        
        while n != 0 {
            counter += n & 1
            n >>= 1
        }
        
        return counter
    }
}

/*:
 ## Bit Manipulation
 ![submission](3.png)
 */
class Solution3 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n, counter = 0
        
        while n != 0 {
            counter += 1
            n &= n - 1 // NOTE: https://stackoverflow.com/questions/4678333/n-n-1-what-does-this-expression-do
        }
        
        return counter
    }
}
