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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            if let left = root.left, let right = root.right {
                let successor = successor(root)
                root.val = successor.val
                root.right = deleteNode(right, successor.val)
            } else if let left = root.left {
                return left
            } else if let right = root.right {
                return right
            } else {
                return nil
            }
        }
        
        return root
    }
    
    func successor(_ node: TreeNode) -> TreeNode {
        guard node.right != nil else { return node }

        var cur = node.right!
        
        while let left = cur.left  {
            cur = left
        }
        
        return cur
    }
}

let s = Solution()

s.deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(6, nil, TreeNode(7))), 5)
s.deleteNode(TreeNode(5), 5)
s.deleteNode(nil, 0)

class Solution2 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        func find(_ node: TreeNode?, _ key: Int, _ parent: TreeNode? = nil) -> (TreeNode?, TreeNode?)? {
            guard let node = node else { return nil }
            
            if node.val == key {
                return (node, parent)
            } else if node.val > key {
                return find(node.left, key, node)
            } else {
                return find(node.right, key, node)
            }
        }
        
        func successor(_ node: TreeNode) -> TreeNode {
            guard node.right != nil else { return node }

            var cur = node.right!
            
            while let left = cur.left  {
                cur = left
            }
            
            return cur
        }
        
        guard var n = find(root, key), var node = n.0 else { return root }
        let parent = n.1
        
        if let left = node.left, let right = node.right {
            var s = successor(node)
            node.val = s.val
            node.right = deleteNode(node.right, s.val)
            
        } else if let left = node.left {
            guard let parent = parent else { return left }
            
            if parent.left === node {
                parent.left = left
            } else {
                parent.right = left
            }
            
        } else if let right = node.right {
            guard let parent = parent else { return right }
            
            if parent.left === node {
                parent.left = right
            } else {
                parent.right = right
            }
            
        } else {
            guard let parent = parent else { return nil }
            
            if parent.left === node {
                parent.left = nil
            } else {
                parent.right = nil
            }
        }
        
        return root
    }
}

let s2 = Solution2()

s2.deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(6, nil, TreeNode(7))), 5)
s2.deleteNode(TreeNode(5), 5)
s2.deleteNode(nil, 0)
