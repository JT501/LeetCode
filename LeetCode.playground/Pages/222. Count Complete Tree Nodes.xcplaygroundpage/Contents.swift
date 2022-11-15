import Foundation

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
 ### Time: O(logN * logN)
 ### Space: O(logN)
 */
class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var left = 1, right = 1
        
        var cur: TreeNode? = root
        while cur?.left != nil {
            left += 1
            cur = cur?.left
        }
        
        cur = root
        while cur?.right != nil {
            right += 1
            cur = cur?.right
        }
        
        if left == right {
            return Int(pow(2, Double(left))) - 1
        } else {
            return 1 + countNodes(root.left) + countNodes(root.right)
        }
    }
}

let s = Solution().countNodes

s(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), nil)))
