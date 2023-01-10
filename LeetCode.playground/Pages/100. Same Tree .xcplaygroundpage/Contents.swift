/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        
        if p?.val != q?.val { return false }
        
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

let s = Solution().isSameTree

s(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(1, TreeNode(2), TreeNode(3)))
