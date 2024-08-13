/*:
 ## Tree, Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

import DequeModule

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var queue = Deque([root])
        var ans = [[Int]]()
        var isLeftToRight = true

        while !queue.isEmpty {
            let size = queue.count
            var curr = [Int]()

            for i in 0..<size {
                let node = isLeftToRight ? queue.popFirst()! : queue.popLast()!
                curr.append(node.val)
                
                if isLeftToRight {
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                } else {
                    if let right = node.right {
                        queue.prepend(right)
                    }
                    if let left = node.left {
                        queue.prepend(left)
                    }
                }
            }
            ans.append(curr)
            isLeftToRight.toggle()
        }

        return ans
    }
}
