class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 1 || x == 0 { return x }
        if n == 0 { return 1 }
        
        return n > 0 ? getPow(x, n) : 1 / getPow(x, -n)
    }
    
    private func getPow(_ x: Double, _ n: Int) -> Double {
        if n == 1 {
            return x
        }
        
        let half = getPow(x, n / 2)
        
        if n % 2 == 0 {
            return half * half
        } else {
            return half * half * x
        }
    }
}

let s = Solution()

s.myPow(2.00000, 10)
s.myPow(2.10000, 3)
s.myPow(2.00000, -2)
s.myPow(2.00000, -2147483648)
