/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min
        
        func findMax(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftMax = findMax(node.left)
            let rightMax = findMax(node.right)
            let totalMax = leftMax + rightMax + node.val
            
            ans = max(ans, totalMax, rightMax + node.val, leftMax + node.val, node.val)
            
            return max(leftMax + node.val, rightMax + node.val, node.val)
        }
        
        findMax(root)
        
        return ans
    }
}

let s = Solution().maxPathSum

s(TreeNode(1, TreeNode(2), TreeNode(3)))
s(TreeNode(-10, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s(TreeNode(2, TreeNode(-1), nil))

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var ans = Int.min
        
        func findMax(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftMax = max(findMax(node.left), 0)
            let rightMax = max(findMax(node.right), 0)
            let totalMax = leftMax + rightMax + node.val
            
            ans = max(ans, totalMax)
            
            return max(leftMax, rightMax) + node.val
        }
        
        findMax(root)
        
        return ans
    }
}

let s2 = Solution2().maxPathSum

s2(TreeNode(1, TreeNode(2), TreeNode(3)))
s2(TreeNode(-10, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s2(TreeNode(2, TreeNode(-1), nil))
