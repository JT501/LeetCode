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
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        func check(_ node: TreeNode?, _ low: Int, _ high: Int) -> Bool {
            guard let node = node else { return true }
            
            if node.val < high && node.val > low {
                return check(node.left, low, node.val) && check(node.right, node.val, high)
            } else {
                return false
            }
        }
        
        return check(root, .min, .max)
    }
}

let s = Solution()

s.isValidBST(TreeNode(2, TreeNode(1), TreeNode(3)))
s.isValidBST(TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6))))
s.isValidBST(TreeNode(5, TreeNode(4), TreeNode(6, TreeNode(3), TreeNode(7))))
