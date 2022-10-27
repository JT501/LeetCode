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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else { return [] }
        return generateTrees(min: 1, max: n)
    }
    
    /// To be used as dictionary identifier
    private struct MinMax: Hashable {
        let min: Int
        let max: Int
    }
    
    /// Cache
    private var memo = [MinMax: [TreeNode?]]()
    
    private func generateTrees(min: Int, max: Int) -> [TreeNode?] {
        if min == max { return [TreeNode(min)] }
        guard min < max else {
            // Not just a `[]` to allow iteration once on the mixing step
            return [nil]
        }
        
        // Look for a cached value
        let id = MinMax(min: min, max: max)
        if let cached = memo[id] {
            return cached
        }
        
        var result = [TreeNode?]()
        
        // We'll choose every value from the range as a tree root
        for step in min...max {
            /// All the possible trees with the value minor than the root
            let leftTrees = generateTrees(min: min, max: step - 1)
            /// All the possible trees with the value greater than the root
            let rightTrees = generateTrees(min: step + 1, max: max)
            
            // Just mix all the variants
            for left in leftTrees {
                for right in rightTrees {
                    let node = TreeNode(step)
                    node.left = left
                    node.right = right
                    result.append(node)
                }
            }
        }
        
        // Save to cache
        memo[id] = result
        
        return result
    }
}

let s = Solution()

s.generateTrees(4)
