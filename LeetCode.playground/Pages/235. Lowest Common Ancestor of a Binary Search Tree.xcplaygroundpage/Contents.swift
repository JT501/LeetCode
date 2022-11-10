//: ![submission](235.png)

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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let node = root, let p = p, let q = q else { return nil }
        
        if (node.val > p.val && node.val > q.val) {
            return lowestCommonAncestor(node.left, p, q)
        } else if (node.val < p.val && node.val < q.val) {
            return lowestCommonAncestor(node.right, p, q)
        } else {
            // if node == p OR node == q OR p < node < q OR q < node < p
            return node
        }
    }
}

let s = Solution()

s.lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(2), TreeNode(8))
s.lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(2), TreeNode(4))
s.lowestCommonAncestor(TreeNode(2, TreeNode(1), nil), TreeNode(2), TreeNode(1))
