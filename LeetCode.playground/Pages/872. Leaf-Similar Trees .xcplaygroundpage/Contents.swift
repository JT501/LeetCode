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
 ### Time: O(N+M)
 ### Space: O(H1+H2) , height of the trees
 ![submission](1.png)
 */

class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        return getLeaves(root1, []) == getLeaves(root2, [])
    }
    
    func getLeaves(_ root: TreeNode?, _ seq: [Int]) -> [Int] {
        guard let root = root else { return seq }
        
        var seq = seq
        
        if root.left == nil && root.right == nil {
            seq.append(root.val)
        }
        if let left = root.left {
            seq = getLeaves(left, seq)
        }
        if let right = root.right {
            seq = getLeaves(right, seq)
        }
        
        return seq
    }
}

let s = Solution().leafSimilar

s(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(1, TreeNode(3), TreeNode(2)))
