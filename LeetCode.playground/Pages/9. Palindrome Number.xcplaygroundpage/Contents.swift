class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        if x <= 9 { return true }
        
        func reverse(_ x: Int) -> Int {
            var x = x
            var result = 0
            while x > 0 {
                result = result * 10 + x % 10
                x = x / 10
            }
            
            return result
        }
        
        return x == reverse(x)
    }
}


let s = Solution()

s.isPalindrome(123)
s.isPalindrome(121)
s.isPalindrome(-121)
