/*:
 ## Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var tokens = tokens
        var stack = Stack<Int>()

        for s in tokens {
            if let number = Int(s) {
                stack.push(number)
            } else {
                let top = stack.pop()!
                switch s {
                    case "+":
                        stack.push(stack.pop()! + top)
                    case "-":
                        stack.push(stack.pop()! - top)
                    case "*":
                        stack.push(stack.pop()! * top)
                    case "/":
                        stack.push(stack.pop()! / top)
                    default:
                        continue
                }
            }
        }

        return stack.peek()!
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

let s = Solution().evalRPN

s(["2","1","+","3","*"])
s(["4","13","5","/","+"])
s(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
