/*:
 ## Queue, Stack, Linked List
 ![submision](1.png)
 */
class MyStack {
    private var q: Queue

    init() {
        q = Queue()
    }

    func push(_ x: Int) {
        let size = q.size
        q.enqueue(x)

        for _ in 0 ..< size {
            q.enqueue(q.peek()!)
            q.dequeue()
        }
    }

    func pop() -> Int {
        q.dequeue()!
    }

    func top() -> Int {
        q.peek()!
    }

    func empty() -> Bool {
        q.isEmpty
    }
    
    
    // Linked List
    class ListNode {
        var value: Int
        var next: ListNode?

        init(_ value: Int, _ next: ListNode? = nil) {
            self.value = value
            self.next = next
        }
    }

    // Queue using Linked List
    struct Queue {
        var front: ListNode?
        var rear: ListNode?
        var size: Int = 0

        init() {}

        var isEmpty: Bool {
            front == nil
        }

        mutating func peek() -> Int? {
            front?.value
        }

        mutating func enqueue(_ value: Int) {
            if isEmpty {
                front = ListNode(value, front)
                rear = front
            } else {
                rear?.next = ListNode(value)
                rear = rear?.next
            }

            size += 1
        }

        mutating func dequeue() -> Int? {
            if isEmpty { return nil }

            let value = front?.value
            front = front?.next

            if isEmpty { rear = nil }
            size -= 1

            return value
        }
    }
}



/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
