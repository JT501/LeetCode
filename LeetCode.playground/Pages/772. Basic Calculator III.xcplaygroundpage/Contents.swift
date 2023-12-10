/*:
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func calculate(_ s: String) -> Int {
        var s = Array(s)
        var start = 0

        func run(_ i: inout Int) -> Int {
            var curNumber = 0
            var lastNumber = 0
            var result = 0
            var lastOperator: Character = s.first == "-" ? "-" : "+"

            func update(operation: Character, value: Int) {
                switch operation {
                    case "+":
                        result += lastNumber
                        lastNumber = curNumber
                    case "-":
                        result += lastNumber
                        lastNumber = -curNumber
                    case "*":
                        lastNumber *= curNumber
                    case "/":
                        lastNumber /= curNumber
                    default:
                        break
                }
                curNumber = 0
            }

            while i < s.count {
                switch s[i] {
                    case "0"..."9":
                        curNumber = curNumber * 10 + Int("\(s[i])")!
                    case "+", "-", "*", "/":
                        update(operation: lastOperator, value: curNumber)
                        lastOperator = s[i]
                    case "(":
                        i += 1
                        curNumber = run(&i)
                    case ")":
                        update(operation: lastOperator, value: curNumber)
                        return result + lastNumber
                    default:
                        break
                }
                i += 1
            }

            update(operation: lastOperator, value: curNumber)

            return result + lastNumber
        }

        return run(&start)
    }
}

/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func calculate(_ s: String) -> Int {
        var s = Array(s)
        var start = 0

        func run(_ i: inout Int) -> Int {
            var stack = Stack<Int>()
            var curNumber = 0
            var lastOperator: Character = s.first == "-" ? "-" : "+"

            func update(operation: Character, value: Int) {
                switch operation {
                    case "+":
                        stack.push(value)
                    case "-":
                        stack.push(-value)
                    case "*":
                        stack.push(stack.pop()! * value)
                    case "/":
                        stack.push(stack.pop()! / value)
                    default:
                        break
                }
            }

            while i < s.count {
                switch s[i] {
                    case "0"..."9":
                        curNumber = curNumber * 10 + Int("\(s[i])")!
                    case "+", "-", "*", "/":
                        update(operation: lastOperator, value: curNumber)
                        lastOperator = s[i]
                        curNumber = 0
                    case "(":
                        i += 1
                        curNumber = run(&i)
                    case ")":
                        update(operation: lastOperator, value: curNumber)
                        return stack.toArray().reduce(0, +)
                    default:
                        break
                }
                i += 1
            }

            update(operation: lastOperator, value: curNumber)

            return stack.toArray().reduce(0, +)
        }

        return run(&start)
    }
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
