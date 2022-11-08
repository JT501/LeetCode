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

class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        
        if val > root.val {
            root.right = insertIntoBST(root.right, val)
        } else if val < root.val {
            root.left = insertIntoBST(root.left, val)
        }
        
        return root
    }
}

let s = Solution()

s.insertIntoBST(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7)), 5)
s.insertIntoBST(nil, 5)

class Solution2 {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        
        func search(_ node: TreeNode, _ val: Int) {
            if val > node.val {
                if let right = node.right {
                    search(right, val)
                } else {
                    node.right = TreeNode(val)
                }
            } else if val < node.val {
                if let left = node.left {
                    search(left, val)
                } else {
                    node.left = TreeNode(val)
                }
            }
            
            return
        }
        
        search(root, val)
        
        return root
    }
}

let s2 = Solution2()

s2.insertIntoBST(TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7)), 5)
s2.insertIntoBST(nil, 5)
