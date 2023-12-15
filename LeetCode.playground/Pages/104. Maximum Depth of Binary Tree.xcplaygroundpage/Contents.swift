/*:
 ## Binary Tree, Recursion
 ### Time: O(n)
 ### Space: O(㏒n)
 ![submission](1.png)
 */
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }
}

let s = Solution()

s.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s.maxDepth(TreeNode(1, nil, TreeNode(2)))

class Solution2 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack = [(Int, TreeNode?)]()

        stack.append((1, root))
        var depth = 0

        while !stack.isEmpty {
            let (current_depth, _root) = stack.removeLast()

            if let _root = _root {
                depth = max(depth, current_depth)
                stack.append((current_depth + 1, _root.left))
                stack.append((current_depth + 1, _root.right))
            }
        }

        return depth
    }
}

let s2 = Solution2()

s2.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7))))
s2.maxDepth(TreeNode(1, nil, TreeNode(2)))

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
