public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BSTIterator {
    var stack: [TreeNode] = []
    
    init(_ root: TreeNode?) {
        appendStack(root)
    }
    
    func next() -> Int {
        let next = stack.removeLast()
        
        appendStack(next.right)
        
        return next.val
    }
    
    func hasNext() -> Bool {
        !stack.isEmpty
    }
    
    private func appendStack(_ node: TreeNode?) {
        var node = node
        while node != nil {
            stack.append(node!)
            node = node!.left
        }
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
