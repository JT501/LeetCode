/*:
 ## Tree, Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

import DequeModule

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var queue = Deque([root])
        var ans = [[Int]]()

        while !queue.isEmpty {
            let size = queue.count
            var curLevel = [Int]()

            for i in 0..<size {
                let node = queue.popFirst()!

                curLevel.append(node.val)

                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            ans.append(curLevel)
        }

        return ans
    }
}
