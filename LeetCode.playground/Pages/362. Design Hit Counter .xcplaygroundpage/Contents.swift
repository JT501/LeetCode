/*:
 ## Queue
 ### Time: O(1)
 ### Space: O(1)
 ![submission](1.png)
 */
class HitCounter {

    var queue: Queue

    init() {
        queue = Queue()
    }
    
    func hit(_ timestamp: Int) {
        queue.enqueue(timestamp)
    }
    
    func getHits(_ timestamp: Int) -> Int {
        while !queue.isEmpty {
            let diff = timestamp - queue.peek()!
            if diff >= 300 {
                queue.dequeue()
            } else {
                break
            }
        }
        return queue.size
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

    class ListNode {
        var value: Int
        var next: ListNode?

        init(_ value: Int, _ next: ListNode? = nil) {
            self.value = value
            self.next = next
        }
    }
}


/*:
 ## Circular Queue + Hashtable
 ### Time: O(1)
 ### Space: O(1)
 ![submission](2.png)
 */
class HitCounter2 {

    var hashtable: [Int: Int] = [:]
    var queue = CircularQueue(300)

    init() {}

    func moveTimeline(timestamp: Int) {
        // If diff >= 300, reset the queue and table
        if (timestamp - queue.Rear()) >= 300 {
            hashtable.removeAll()
            queue = CircularQueue(300)
            queue.enQueue(timestamp)
        } else if queue.Rear() < timestamp {
            for i in (queue.Rear() + 1)...timestamp {
                if !queue.enQueue(i) {
                    hashtable.removeValue(forKey: queue.Front())
                    queue.deQueue()
                    queue.enQueue(i)
                }
            }
        }
    }
    
    func hit(_ timestamp: Int) {
        moveTimeline(timestamp: timestamp)
        hashtable[timestamp, default: 0] += 1
    }
    
    func getHits(_ timestamp: Int) -> Int {
        if timestamp < queue.Front() {
            return 0
        }

        moveTimeline(timestamp: timestamp)
        
        var result = 0
        for i in queue.Front() ... timestamp {
            result += hashtable[i, default: 0]
        }
        return result
    }

    class CircularQueue {
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
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */
