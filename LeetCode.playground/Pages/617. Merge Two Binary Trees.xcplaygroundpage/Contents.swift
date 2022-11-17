/*:
 ## Depth First Search
 ### Time: O(m) where m = min nodes of two trees
 ### Space: O(m)
 ![submission](1.png)
 */
class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if let node1 = root1, let node2 = root2 {
            let newNode = TreeNode(node1.val + node2.val)
            newNode.left = mergeTrees(node1.left, node2.left)
            newNode.right = mergeTrees(node1.right, node2.right)
            
            return newNode
        } else if let node1 = root1 {
            return node1
        } else if let node2 = root2 {
            return node2
        } else {
            return nil
        }
    }
}

let s = Solution().mergeTrees

s(TreeNode(1, TreeNode(3, TreeNode(5), nil), TreeNode(2)), TreeNode(2, TreeNode(1, nil, TreeNode(4)), TreeNode(3, nil, TreeNode(7))))
s(TreeNode(1), TreeNode(1, TreeNode(2), nil))
