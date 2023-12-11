/*:
 ## Monotonic Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func trap(_ height: [Int]) -> Int {
        var monoStack = Stack<Int>()
        var result = 0

        for (i, h) in height.enumerated() {
            if monoStack.isEmpty || h <= height[monoStack.peek()!] {
                monoStack.push(i)
            } else {
                while !monoStack.isEmpty, h > height[monoStack.peek()!] {
                    let lastPop = monoStack.pop()!
                    
                    if monoStack.isEmpty { break }
                    
                    let distance = i - 1 - monoStack.peek()!
                    let high = min(h, height[monoStack.peek()!]) - height[lastPop]
                    
                    result += distance * high
                }

                monoStack.push(i)
            }
        }

        return result
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
    }
}

let s = Solution().trap

s([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])

/*:
 ## Two Pointers
 ### Time: O(n)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var left_max = 0, right_max = 0
        var result = 0

        while left < right {
            if height[left] < height[right] {
                if height[left] >= left_max {
                    left_max = height[left]
                } else {
                    result += left_max - height[left]
                }
                left += 1
            } else {
                if height[right] >= right_max {
                    right_max = height[right]
                } else {
                    result += right_max - height[right]
                }
                right -= 1
            }
        }

        return result
    }
}
