/*:
 ## Monotonic Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var monoStack = [Int]()
        var ans = Array(repeating: 0, count: temperatures.count)
        
        for (i, temperature) in temperatures.enumerated() {
            if monoStack.isEmpty || temperature < temperatures[monoStack.last!] {
                monoStack.append(i)
            } else {
                while !monoStack.isEmpty && temperature > temperatures[monoStack.last!] {
                    let lastIndex = monoStack.removeLast()
                    ans[lastIndex] = i - lastIndex
                }
                monoStack.append(i)
            }
        }
        
        return ans
    }
}

let s = Solution().dailyTemperatures

s([73,74,75,71,69,72,76,73])
s([30,40,50,60])
s([30,60,90])
