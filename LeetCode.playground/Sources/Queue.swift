class Queue<T> {
    private var top: Node<T>?
    var count: Int = 0
    
    func peek() -> T? {
        top?.value
    }
    
    func push(value: T) {
        top = Node(value: value, next: top)
        count += 1
    }
    
    func pop() -> T? {
        if let value = top?.value {
            top = top?.next
            count -= 1
            
            return value
        } else {
            return nil
        }
    }
}

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
