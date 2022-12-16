/*:
 ![submission](1.png)
 */
class MyQueue {
    private var stack1 = [Int](), stack2 = [Int]()
    private var front: Int? = nil

    init() {}
    
    func push(_ x: Int) {
        if stack1.isEmpty {
            front = x
        }
        stack1.append(x)
    }
    
    /*:
     ### Time: Amortized O(1), Worst-case O(N)
     */
    func pop() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
        }
        return stack2.removeLast()
    }
    
    func peek() -> Int {
        if stack2.isEmpty {
            return front!
        }
        return stack2.last!
    }
    
    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
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
