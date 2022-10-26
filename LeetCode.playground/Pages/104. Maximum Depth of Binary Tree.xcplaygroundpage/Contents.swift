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
    func maxDepth(_ root: TreeNode?) -> Int {
        
        func dig(_ root: TreeNode?, count: Int) -> Int {
            if let root = root {
                return max(dig(root.left, count: count + 1), dig(root.right, count: count + 1))
            } else {
                return count
            }
        }
        
        return dig(root, count: 0)
    }
}

let s = Solution()

s.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s.maxDepth(TreeNode(1, nil, TreeNode(2)))
