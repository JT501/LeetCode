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
 ### Space: O(log N)
 ![submission](1.png)
 */
class Solution {
    func connect(_ root: Node?) -> Node? {
        var pre = root
        var cur: Node? = nil
        
        while pre?.left != nil {
            cur = pre
            
            while cur != nil {
                cur?.left?.next = cur?.right
                
                if cur?.next != nil {
                    cur?.right?.next = cur?.next?.left
                }
                cur = cur?.next
            }
            pre = pre?.left
        }
        
        return root
    }
}

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(log N)
 ![submission](2.png)
 */
class Solution2 {
    func connect(_ root: Node?) -> Node? {
        func dfs(_ node: Node?) {
            guard let node = node else {
                return
            }
            
            if let left = node.left {
                left.next = node.right
                dfs(left)
            }
            if let right = node.right {
                right.next = node.next?.left
                dfs(right)
            }
        }
        
        dfs(root)
        
        return root
    }
}

/*:
 ## Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            var rightNode: Node? = nil
            let size = queue.count
            
            for _ in 0..<size {
                let cur = queue.removeFirst()
                
                cur.next = rightNode
                rightNode = cur
                
                if let right = cur.right, let left = cur.left {
                    queue.append(right)
                    queue.append(left)
                }
            }
        }

        return root
    }
}
