struct Stack<T> {
    internal var array = [T]()
    
    var isEmpty: Bool { array.isEmpty }
    var count: Int { array.count }
    
    mutating func push(_ element: T) { array.append(element) }
    
    mutating func pop() -> T? { array.popLast() }
    
    var top: T? { array.last }
}

/*:
 ## Stack
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func calculate(_ s: String) -> Int {
        var s = s
        var stack = Stack<Int>()
        var number = 0
        var sign = 1
        var result = 0
        
        for char in s {
            switch char {
            case "0"..."9":
                number = (number * 10 + Int("\(char)")!)
            case "+":
                result += number * sign
                number = 0
                sign = 1
            case "-":
                result += number * sign
                sign = -1
                number = 0
            case "(":
                stack.push(result)
                stack.push(sign)
                sign = 1
                result = 0
                number = 0
            case ")":
                result += number * sign
                result *= stack.pop()!
                result += stack.pop()!
                number = 0
                sign = 1
            default:
                break
            }
        }
        
        return result + number * sign
    }
}

let s = Solution().calculate

s("1 + 1")
s(" 2-1 + 2 ")
s("(1+(4+5+2)-3)+(6+8)")
s("- (3 + (4 + 5))")
s("1-11")
s("2-4-(8+2-6+(8+4-(1)+8-10))")
