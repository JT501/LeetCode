/*:
 ## Stack
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func isValid(_ s: String) -> Bool {
        let parenthese: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
        var stack = Stack<Character>()

        for char in s {
            if let top = stack.peek(), char == parenthese[top] {
                stack.pop()
            } else {
                stack.push(char)
            }
        }

        return stack.isEmpty
    }

    class Node<T> {
        var value: T
        var next: Node?

        init(_ value: T, _ next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    class Stack<T> {
        private var top: Node<T>?
        var size = 0
        var isEmpty: Bool {
            size == 0
        }

        init() {}

        func peek() -> T? {
            top?.value
        }

        func push(_ value: T) {
            top = Node(value, top)
            size += 1
        }

        func pop() -> T? {
            if isEmpty { return nil }

            let value = top?.value
            top = top?.next
            size -= 1

            return value
        }
    }
}

/*:
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }

        var characters = [Character]()
        let open: [Character] = ["(", "[", "{"]
        let close: [Character: Character] = ["(": ")", "[": "]", "{": "}"]

        for c in s {
            if open.contains(c) {
                characters.append(c)
                continue
            }

            if let last = characters.last, c == close[last] {
                characters.removeLast()
            } else {
                return false
            }
        }

        return characters.isEmpty
    }
}

let s2 = Solution2().isValid

s2("((")
s2("()")
s2("()[]{}")
s2("(]")
s2("(([[]])){}")
s2("([)]")
s2("(([]))")
s2("(())[]")

/*:
 ## Recursive
 */
class Solution3 {
    func isValid(_ s: String) -> Bool {
        let s = Array(s)
        var done = Set<Int>()
        let open: [Character] = ["(", "[", "{"]
        let close: [Character: Character] = ["(": ")", "[": "]", "{": "}"]

        guard s.count % 2 == 0 else { return false }
        guard let firstChar = s.first, open.contains(firstChar) else { return false }

        var opens = [Int]()

        // Check all open brackets
        for (i, c) in s.enumerated() {
            if open.contains(c) {
                opens.append(i)
            }
        }

        // If open brackets not half of string, return false
        if opens.count != s.count / 2 {
            return false
        }

        // Recursively check the brackets
        func check(end: Int) -> Bool {
            guard end < s.count else { return false }

            let start = opens.last!
            var end = end

            if s[end] == close[s[start]] {
                done.insert(start)
                done.insert(end)
                opens.removeLast()

                if opens.isEmpty {
                    return true
                }

                end = opens.last! + 1
                while done.contains(end) {
                    end += 1
                }

                return check(end: end)
            }

            return false
        }

        return check(end: opens.last! + 1)
    }
}

let s3 = Solution3().isValid

s3("((")
s3("()")
s3("()[]{}")
s3("(]")
s3("(([[]])){}")
s3("([)]")
s3("(([]))")
s3("(())[]")
