/*:
 ## Queue, Linked List
 ### Time: O(1)
 ### Space: O(n)
 ![submission](1.png)
 */
class MyCircularQueue {

    class Node {
        var value: Int
        var next: Node?

        init(_ value: Int, _ next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    var size: Int
    var capacity: Int
    var head: Node?
    var tail: Node?

    init(_ k: Int) {
        capacity = k
        size = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }

        if isEmpty() {
            head = Node(value)
            tail = head
        } else {
            tail?.next = Node(value)
            tail = tail?.next
        }
        size += 1

        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() { return false }

        head = head?.next
        size -= 1

        if isEmpty() { tail = nil }

        return true
    }
    
    func Front() -> Int {
        head?.value ?? -1
    }
    
    func Rear() -> Int {
        tail?.value ?? -1
    }
    
    func isEmpty() -> Bool {
        size == 0
    }
    
    func isFull() -> Bool {
        size == capacity
    }
}

/*:
 ## Queue, Array
 ### Time: O(1)
 ### Space: O(n)
 ![submission](2.png)
 */
class MyCircularQueue2 {

    var capacity: Int
    var elements: [Int?]
    var frontIdx: Int
    var rearIdx: Int
    var size: Int

    init(_ k: Int) {
        capacity = k
        elements = Array(repeating: nil, count: capacity)
        frontIdx = -1
        rearIdx = -1
        size = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if self.isFull() { return false }

        if self.isEmpty() {
            frontIdx = 0
            rearIdx = 0
        } else if rearIdx < capacity - 1 {
            rearIdx += 1
        } else {
            rearIdx = 0
        }

        elements[rearIdx] = value
        size += 1

        return true
    }
    
    func deQueue() -> Bool {
        if self.isEmpty() { return false }
        elements[frontIdx] = nil
        
        if frontIdx < capacity - 1 {
            frontIdx += 1
        } else {
            frontIdx = 0
        }
        size -= 1

        if self.isEmpty() {
            frontIdx = -1
            rearIdx = -1
        }

        return true
    }
    
    func Front() -> Int {
        size > 0 ? elements[frontIdx]! : -1
    }
    
    func Rear() -> Int {
        size > 0 ? elements[rearIdx]! : -1
    }
    
    func isEmpty() -> Bool {
        self.size == 0
    }
    
    func isFull() -> Bool {
        self.size == capacity
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */
