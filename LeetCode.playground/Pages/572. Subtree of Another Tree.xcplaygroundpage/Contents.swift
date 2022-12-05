/*:
 ## Depth First Search
 ### Time: O(M*N)
 ### Space: O(M+N)
 ![submission](1.png)
 */
class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        if isIdentical(root, subRoot) {
            return true
        } else {
            return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
        }
    }
    
    func isIdentical(_ r: TreeNode?, _ s: TreeNode?) -> Bool {
        if let r = r, let s = s {
            return r.val == s.val && isIdentical(r.left, s.left) && isIdentical(r.right, s.right)
        } else {
            return r == nil && s == nil
        }
    }
}

let s = Solution().isSubtree

s(TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2)), TreeNode(5)), TreeNode(4, TreeNode(1), TreeNode(2)))
s(TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2, TreeNode(0), nil)), TreeNode(5)), TreeNode(4, TreeNode(1), TreeNode(2)))
s(nil, nil)
