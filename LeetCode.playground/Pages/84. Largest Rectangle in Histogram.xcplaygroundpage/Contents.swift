/*:
 ## Monotonic Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var monoStack = Stack<Int>()
        var ans = 0

        for (i, h) in heights.enumerated() {
            while !monoStack.isEmpty, h <= heights[monoStack.peek()!] {
                let top = monoStack.pop()!
                let width = i - (monoStack.peek() ?? -1) - 1
                let area = heights[top] * width

                ans = max(ans, area)
            }
            monoStack.push(i)
        }

        while !monoStack.isEmpty {
            let top = monoStack.pop()!
            let width = heights.count - (monoStack.peek() ?? -1) - 1
            let area = heights[top] * width

            ans = max(ans, area)
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

/*:
 ## Brute Force (Time Exceeded)
 ### Time: O(n²)
 ### Space: O(1)
 */
class Solution2 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var length = heights.count
        var left_min = 0
        var right_min = 0
        var ans = heights.first!

        guard length > 1 else { return ans }

        for i in 0 ..< length {
            var area = 0
            for j in (0 ..< i).reversed() {
                if heights[j] >= heights[i] {
                    area += heights[i]
                } else {
                    break
                }
            }

            for j in i ..< length {
                if heights[j] >= heights[i] {
                    area += heights[i]
                } else {
                    break
                }
            }
            ans = max(ans, area)
        }

        return ans
    }
}
