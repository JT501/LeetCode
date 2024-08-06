/*:
 ## Tree, Recursion
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }

        if p?.val != q?.val { return false }

        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

let s = Solution().isSameTree

s(TreeNode(1, TreeNode(2), TreeNode(3)), TreeNode(1, TreeNode(2), TreeNode(3)))


/*:
 ## Tree, Stacks
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var p = p, q = q
        var stack = [(p, q)]

        while !stack.isEmpty {
            (p, q) = stack.removeLast()
            if p?.val != q?.val { return false }
            if p == nil && q == nil { continue }
            stack.append((p?.right, q?.right))
            stack.append((p?.left, q?.left))
        }

        return true
    }
}
