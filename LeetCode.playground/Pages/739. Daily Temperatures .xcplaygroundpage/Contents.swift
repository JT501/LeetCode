/*:
 ## Monotonic Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var monoStack = Stack<Int>()
        var ans = Array(repeating: 0, count: temperatures.count)

        for (i, t) in temperatures.enumerated() {
            if monoStack.isEmpty || t <= temperatures[monoStack.peek()!] {
                monoStack.push(i)
            } else {
                while !monoStack.isEmpty, t > temperatures[monoStack.peek()!] {
                    ans[monoStack.peek()!] = i - monoStack.pop()!
                }
                monoStack.push(i)
            }
        }

        return ans
    }

    class Stack<T> {
        private var elements: [T] = []
        var isEmpty: Bool {
            elements.isEmpty
        }

        init() {}

        func peek() -> T? {
            elements.last
        }

        func push(_ value: T) {
            elements.append(value)
        }

        func pop() -> T? {
            elements.removeLast()
        }

        func toArray() -> [T] {
            elements
        }
    }
}

let s = Solution().dailyTemperatures

s([73, 74, 75, 71, 69, 72, 76, 73])
s([30, 40, 50, 60])
s([30, 60, 90])
