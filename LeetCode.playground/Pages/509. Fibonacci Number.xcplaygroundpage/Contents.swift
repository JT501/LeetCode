class Solution {
    func fib(_ n: Int) -> Int {
        var fibs: [Int: Int] = [:]
        
        func calFibs(_ n: Int) -> Int {
            if n <= 1 {
                return n
            } else if let val = fibs[n] {
                return val
            } else {
                let res = calFibs(n - 1) + calFibs(n - 2)
                fibs[n] = res
                
                return res
            }
        }
        
        return calFibs(n)
    }
}

let s = Solution()

s.fib(10)
