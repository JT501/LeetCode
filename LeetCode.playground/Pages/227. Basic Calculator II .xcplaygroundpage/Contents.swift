/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func calculate(_ s: String) -> Int {
        var s = s
        var length = s.count
        var number = 0
        var lastNumber = 0
        var operation: Character = "+"
        var result = 0

        for (i, c) in s.enumerated() {
            if let n = Int("\(c)") {
                number = number * 10 + n
            }
            if Int("\(c)") == nil && c != " " || i == length - 1 {
                switch operation {
                    case "+":
                        result += lastNumber
                        lastNumber = number
                    case "-":
                        result += lastNumber
                        lastNumber = -number
                    case "*":
                        lastNumber *= number
                    case "/":
                        lastNumber /= number
                    default:
                        break
                }
                number = 0
                operation = c
            }
        }

        return result + lastNumber
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
        var s = s
        var length = s.count
        var number = 0
        var operation: Character = "+"
        var stack = Stack<Int>()

        for (i, c) in s.enumerated() {
            if let n = Int("\(c)") {
                number = number * 10 + n
            }
            if Int("\(c)") == nil && c != " " || i == length - 1 {
                switch operation {
                    case "+":
                        stack.push(number)
                    case "-":
                        stack.push(-number)
                    case "*":
                        stack.push(stack.pop()! * number)
                    case "/":
                        stack.push(stack.pop()! / number)
                    default:
                        break
                }
                number = 0
                operation = c
            }
        }

        return stack.toArray().reduce(0, +)
    }
}

/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(1)
 ![submission](3.png)
 */
class Solution3 {
    func calculate(_ s: String) -> Int {
        var s = s + "+"
        var number = 0
        var sign = 1
        var res = 0
        var times = false
        var divide = false
        var stack = Stack<Int>()

        for c in s {
            switch c {
                case "0" ... "9":
                    number = number * 10 + Int("\(c)")!
                case "+":
                    if times {
                        res = res * number
                        times.toggle()
                    } else if divide {
                        res = res / number
                        divide.toggle()
                    } else {
                        res += number * sign
                        sign = 1
                    }
                    if !stack.isEmpty {
                        res = res * sign + stack.pop()!
                        sign = 1
                    }
                    number = 0
                case "-":
                    if times {
                        res = res * number
                        times.toggle()
                    } else if divide {
                        res = res / number
                        divide.toggle()
                    } else {
                        res += number * sign
                        sign = -1
                    }
                    if !stack.isEmpty {
                        res = res * sign + stack.pop()!
                        sign = -1
                    }

                    number = 0
                case "*":
                    if times {
                        res = res * number
                    } else if divide {
                        res = res / number
                        divide.toggle()
                    } else {
                        stack.push(res)
                        res = number
                    }
                    times = true
                    number = 0
                case "/":
                    if times {
                        res = res * number
                        times.toggle()
                    } else if divide {
                        res = res / number
                    } else {
                        stack.push(res)
                        res = number
                    }

                    divide = true
                    number = 0
                default:
                    break
            }
        }
        return res
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
