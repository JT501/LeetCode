/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = Stack<Int>()

        for asteroid in asteroids {
            // new asteroid in right direction will never collide
            if asteroid > 0 || stack.isEmpty {
                stack.push(asteroid)
            } else {
                // new asteroid in left direction
                while true {
                    // if same direction with top asteroid, add to the row
                    if stack.peek()! < 0 {
                        stack.push(asteroid)
                        break
                    } else if abs(stack.peek()!) == abs(asteroid) {
                        // if same size, destroy both asteroids
                        stack.pop()
                        break
                    } else if abs(stack.peek()!) > abs(asteroid) {
                        // if smaller then top asteroid, destroy new one
                        break
                    } else {
                        // if larger then top asteroid, destroy top one
                        stack.pop()
                        // if no more asteroid left in row, add the new one
                        if stack.isEmpty {
                            stack.push(asteroid)
                            break
                        }
                    }
                }
            }
        }

        return stack.toArray()
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
