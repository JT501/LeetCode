public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func getNext(_ root: Node?) -> Node? {
        guard root != nil else { return nil }
        
        var root = root
        
        while root != nil && root?.left == nil && root?.right == nil {
            root = root?.next
        }
        return root != nil ? (root?.left ?? root?.right) : nil
    }
    
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        if let _ = root.left, let right = root.right {
            root.left?.next = right
        } else if let _ = root.left {
            root.left?.next = getNext(root.next)
        }
        if root.right != nil {
            root.right?.next = getNext(root.next)
        }
        
        // Traversing Right Side First
        root.right = connect(root.right)
        root.left = connect(root.left)
        
        return root
    }
}

/*:
 ## Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return root }
        
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            var rightNode: Node? = nil
            
            for _ in 0..<queue.count {
                let current = queue.removeFirst()
                
                current.next = rightNode
                rightNode = current
                
                if let right = current.right {
                    queue.append(right)
                }
                if let left = current.left {
                    queue.append(left)
                }
            }
        }
        
        return root
    }
}
