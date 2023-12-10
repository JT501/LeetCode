/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func calculate(_ s: String) -> Int {
        var s = s
        var stack = Stack<Int>()
        var number = 0
        var sign = 1
        var result = 0

        for c in s {
            switch c {
                case "0"..."9":
                    number = number * 10 + (Int(String(c)) ?? 0)
                case "+":
                    result += number * sign
                    number = 0
                    sign = 1
                case "-":
                    result += number * sign
                    number = 0
                    sign = -1
                case "(":
                    stack.push(result)
                    stack.push(sign)
                    result = 0
                    number = 0
                    sign = 1
                case ")":
                    result += number * sign
                    result = stack.pop()! * result + stack.pop()!
                    number = 0
                    sign = 1
                default:
                    break
            }
        }

        return result + number * sign
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

let s = Solution().calculate

s("1 + 1")
s(" 2-1 + 2 ")
s("(1+(4+5+2)-3)+(6+8)")
s("- (3 + (4 + 5))")
s("1-11")
s("2-4-(8+2-6+(8+4-(1)+8-10))")

/*:
 ## Recursion
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func calculate(_ s: String) -> Int {
        var s = Array(s)
        var idx = 0

        return cal(s, &idx)
    }

    func cal(_ str: [Character], _ idx: inout Int) -> Int {
        var number = 0
        var sign = 1
        var result = 0

        outerloop: while idx < str.count {
            let char = str[idx]
            
            switch char {
                case "0"..."9":
                    number = number * 10 + (Int(String(char)) ?? 0)
                case "+":
                    result += number * sign
                    number = 0
                    sign = 1
                case "-":
                    result += number * sign
                    number = 0
                    sign = -1
                case "(":
                    idx += 1
                    result += sign * cal(str, &idx)
                case ")":
                    break outerloop
                default:
                    break
            }
            idx += 1
        }
        return result + number * sign
    }
}
