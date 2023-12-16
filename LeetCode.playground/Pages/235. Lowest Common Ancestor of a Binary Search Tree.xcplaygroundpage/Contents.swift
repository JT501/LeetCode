/*:
 ## Binary Search Tree, Recursion
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root, let p, let q else { return nil }

        if (p.val <= root.val && q.val >= root.val) || (p.val >= root.val && q.val <= root.val) {
            return root
        } else {
            if p.val < root.val {
                return lowestCommonAncestor(root.left, p, q)
            } else {
                return lowestCommonAncestor(root.right, p, q)
            }
        }
    }
}

let s = Solution()

s.lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(2), TreeNode(8))
s.lowestCommonAncestor(TreeNode(6, TreeNode(2, TreeNode(0), TreeNode(4, TreeNode(3), TreeNode(5))), TreeNode(8, TreeNode(7), TreeNode(9))), TreeNode(2), TreeNode(4))
s.lowestCommonAncestor(TreeNode(2, TreeNode(1), nil), TreeNode(2), TreeNode(1))

/*:
 ## Binary Search Tree, Iterative
 ### Time: O(n)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }

        var node: TreeNode? = root
        while node != nil {
            let value = node!.val
            if (p.val <= value && q.val >= value) || (p.val >= value && q.val <= value) {
                return node
            }
            if p.val < value {
                node = node!.left
            } else {
                node = node!.right
            }
        }

        return node
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
