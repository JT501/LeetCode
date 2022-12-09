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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        func dfs(_ node: TreeNode?, _ maxA: Int, _ minA: Int) -> Int {
            guard let node = node else { return maxA - minA }
            
            var maxA = maxA, minA = minA
            let value = node.val

            maxA = max(maxA, value)
            minA = min(minA, value)
            
            return max(dfs(node.left, maxA, minA), dfs(node.right, maxA, minA))
        }
        
        return dfs(root, root.val, root.val)
    }
}

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var ans = 0
        
        func dfs(_ node: TreeNode?, _ maxA: Int?, _ minA: Int?) {
            guard let node = node else { return }
            
            var maxA = maxA, minA = minA
            let value = node.val
            
            if maxA != nil, minA != nil {
                ans = max(ans, abs(maxA! - value), abs(minA! - value))
                maxA = max(maxA!, value)
                minA = min(minA!, value)
            } else {
                maxA = value
                minA = value
            }
            
            if let left = node.left {
                dfs(left, maxA, minA)
            }
            if let right = node.right {
                dfs(right, maxA, minA)
            }
        }
        
        dfs(root, nil, nil)
        
        return ans
    }
}
