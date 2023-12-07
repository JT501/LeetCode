/*:
 ## Stack
 ### Time: O(n) - Push, O(1) - Others
 ### Space: O(n)
 ![submission](1.png)
 */
class MyQueue {
    var stack = Stack<Int>()
    var stack2 = Stack<Int>()

    init() {}
    
    func push(_ x: Int) {
        while !stack.isEmpty {
          stack2.push(stack.pop()!)
        }
        stack2.push(x)
        
        while !stack2.isEmpty {
          stack.push(stack2.pop()!)
        }
    }
    
    func pop() -> Int {
        stack.pop()!
    }
    
    func peek() -> Int {
        stack.peek()!
    }
    
    func empty() -> Bool {
        stack.isEmpty
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

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
