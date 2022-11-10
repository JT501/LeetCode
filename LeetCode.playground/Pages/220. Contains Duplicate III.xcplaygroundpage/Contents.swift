/*:
 ## Binary Search Tree
 ![submission](220-1.png)
 */
class Solution {
    class BST {
        var val: Int
        var left: BST?
        var right: BST?
        
        init(_ val: Int, _ left: BST? = nil, _ right: BST? = nil) {
            self.val = val
            self.left = left
            self.right = right
        }
        
        private func successor(_ node: BST) -> BST? {
            var cur = node.right
            
            while let left = cur?.left  {
                cur = left
            }
            return cur
        }
        
        private func predecessor(_ node: BST) -> BST? {
            var cur = node.left
            
            while let right = cur?.right {
                cur = right
            }
            return cur
        }
        
        func add(_ val: Int) -> BST? {
            add(self, val)
        }
        
        private func add(_ root: BST?, _ val: Int) -> BST? {
            guard let root = root else { return BST(val) }
            
            if val > root.val {
                root.right = add(root.right, val)
            } else if val < root.val {
                root.left = add(root.left, val)
            }
            
            return root
        }
        
        func delete(_ key: Int) -> BST? {
            return delete(self, key)
        }
        
        private func delete(_ root: BST?, _ key: Int) -> BST? {
            guard let root = root else { return nil }
            
            if root.val > key {
                root.left = delete(root.left, key)
            } else if root.val < key {
                root.right = delete(root.right, key)
            } else {
                if let _ = root.left, let right = root.right {
                    let successor = successor(root)!
                    root.val = successor.val
                    root.right = delete(right, successor.val)
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
        
        func isBetween(_ low: Int, _ high: Int) -> Bool {
            if low...high ~= self.val {
                return true
            }
            if let left = self.left, self.val > low && self.val > high {
                return left.isBetween(low, high)
            }
            if let right = self.right, self.val < low && self.val < high {
                return right.isBetween(low, high)
            }
            return false
        }
        
    }
    
    
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        var root: BST? = nil
        
        for i in 0..<nums.count {
            if let root = root, root.isBetween(nums[i] - valueDiff, nums[i] + valueDiff) {
                return true
            }
            if let root = root {
                root.add(nums[i])
            } else {
                root = BST(nums[i])
            }
            if i >= indexDiff {
                root = root?.delete(nums[i - indexDiff])
            }
        }
        
        return false
    }
}

let s = Solution()

s.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0)
s.containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3)

/*:
 ## Sliding Window
 ![submission](220-2.png)
 */
class Solution2 {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        var end = nums.count - 1
        
        for i in 0..<nums.count {
            for j in i...end {
                if i == j || abs(i - j) > indexDiff { continue }
                if abs(nums[i] - nums[j]) <= valueDiff {
                    return true
                } else if abs(i - j) == indexDiff {
                    break
                }
            }
        }
        return false
    }
}

let s2 = Solution2()

s2.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0)
s2.containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3)
