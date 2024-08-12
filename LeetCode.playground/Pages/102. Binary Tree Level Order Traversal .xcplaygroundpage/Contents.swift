/*:
 ## Tree, Breadth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var queue = Queue([(root, 0)])
        var ans = [[Int]]()
        var temp = [Int]()
        var curLevel = 0

        while !queue.isEmpty {
            let (node, level) = queue.pop()!
            
            if curLevel < level && !temp.isEmpty {
                ans.append(temp)
                temp.removeAll()
            }

            curLevel = level
            temp.append(node.val)

            if let left = node.left {
                queue.push((left, level + 1))
            }
            if let right = node.right {
                queue.push((right, level + 1))
            }
        }

        ans.append(temp)

        return ans
    }
}
