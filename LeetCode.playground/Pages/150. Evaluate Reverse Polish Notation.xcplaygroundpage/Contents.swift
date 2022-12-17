/*:
 ## Stack
 ### Time: O(N)
 ### Space: O(N)
 */
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            if !Set(["+","-","*","/"]).contains(token) {
                stack.append(Int(token)!)
                continue
            }
            
            let firstNum = stack.removeLast()
            let secondNum = stack.removeLast()
            
            var number = 0
            
            if token == "+" {
                number = secondNum + firstNum
            } else if token == "-" {
                number = secondNum - firstNum
            } else if token == "*" {
                number = secondNum * firstNum
            } else if token == "/" {
                number = secondNum / firstNum
            }
            stack.append(number)
        }
        
        return stack.removeLast()
    }
}

let s = Solution().evalRPN

s(["2","1","+","3","*"])
s(["4","13","5","/","+"])
s(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
