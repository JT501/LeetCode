/*:
 ## Stack
 ### Time: O(1)
 ### Space: O(n)
 ![submission](1.png)
 */
class MinStack {

    private var head: Node?
    private var mins: [Int]

    init() {
      mins = []
    }
    
    func push(_ val: Int) {
        head = Node(val, head)
        if !mins.isEmpty {
          mins.append(min(val, mins.last!))
        } else {
          mins.append(val)
        }
    }
    
    func pop() {
        head = head?.next
        mins.removeLast()
    }
    
    func top() -> Int {
        head!.value
    }
    
    func getMin() -> Int {
        mins.last!
    }

    class Node {
      var value: Int
      var next: Node?

      init(_ value: Int, _ next: Node? = nil) {
        self.value = value
        self.next = next
      }
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
