/*:
 ## Binary Tree, Recursion
 ### Time: O(n)
 ### Space: O(㏒n)
 ![submission](1.png)
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return root }

        let temp = invertTree(root.left)
        root.left = invertTree(root.right)
        root.right = temp

        return root
    }
}

/*:
 ## Binary Tree, Queue
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return root }
        var queue = Queue<TreeNode>()

        queue.push(value: root)

        while !queue.isEmpty {
            let current = queue.pop()!
            (current.left, current.right) = (current.right, current.left)

            if let left = current.left {
                queue.push(value: left)
            }

            if let right = current.right {
                queue.push(value: right)
            }
        }

        return root
    }

    class Queue<T> {
        private var top: Node<T>?
        var count: Int = 0
        var isEmpty: Bool {
            count == 0
        }
        
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
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
