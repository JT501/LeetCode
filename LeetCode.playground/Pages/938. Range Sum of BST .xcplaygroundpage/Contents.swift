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

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var ans = 0
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            if (low...high) ~= node.val {
                ans += node.val
            }
            if node.val > low {
                dfs(node.left)
            }
            if node.val < high {
                dfs(node.right)
            }
        }
        
        dfs(root)
        
        return ans
    }
}
