/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func maxProduct(_ root: TreeNode?) -> Int {
        let mod = Int(10e8 + 7)
        var ans = 0
        
        func totalTreeSum(_ node: TreeNode?, _ sum: Int) -> Int {
            
            guard let node = node else { return sum }
            
            let sum = sum + node.val
            
            return totalTreeSum(node.right, totalTreeSum(node.left, sum))
        }
        
        func maxSum(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftMax = maxSum(node.left)
            let rightMax = maxSum(node.right)
            let totalMax = leftMax + rightMax + node.val
            let productMax = totalMax * (treeSum - totalMax)
            
            ans = max(ans, productMax)
            
            return totalMax
        }
        
        let treeSum = totalTreeSum(root, 0)
        maxSum(root)
        
        return ans % mod
    }
}


let s = Solution().maxProduct

s(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), nil)))
s(TreeNode(1, nil, TreeNode(2, TreeNode(3), TreeNode(4, TreeNode(5), TreeNode(6)))))

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func maxProduct(_ root: TreeNode?) -> Int {
        let mod = Int(10e8 + 7)
        var ans = 0
        var allSums = [Int]()
        
        func totalTreeSum(_ node: TreeNode?) -> Int {
            
            guard let node = node else { return 0 }
            
            let leftSum = totalTreeSum(node.left)
            let rightSum = totalTreeSum(node.right)
            let sum = leftSum + rightSum + node.val
            allSums.append(sum)
            
            return sum
        }
        
        let totalSum = totalTreeSum(root)
        
        for sum in allSums {
            ans = max((totalSum - sum) * sum, ans)
        }
        
        return ans % mod
    }
}

let s2 = Solution2().maxProduct

s2(TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), nil)))
s2(TreeNode(1, nil, TreeNode(2, TreeNode(3), TreeNode(4, TreeNode(5), TreeNode(6)))))
