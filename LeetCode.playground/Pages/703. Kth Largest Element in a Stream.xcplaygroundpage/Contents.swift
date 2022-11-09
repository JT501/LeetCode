/*:
 ## Heap
 */
class KthLargest {
    // 1. Use minheap
    // - add all elements into the minheap
    // - and check if minheap count is bigger than the K
    // - then remove minimum elements from it until count is equal to K
    // - this way minheap will have the Kth largest element on the top
    // - minheap time complexities:
    // - constructing meanheap O(nlogn), inserting element O(logn + k), remove element O(logn)
    
    let k: Int
    var minheap = MinHeap<Int>()

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        
        for n in nums {
            minheap.insert(n)
        }
        
        // Make sure to hold only k amount items in the heap
        while minheap.count > k {
            minheap.removeFirst()
        }
    }
    
    func add(_ val: Int) -> Int {
        minheap.insert(val)
        if minheap.count > k {
            minheap.removeFirst()
        }
        
        return minheap.first!
    }
}

struct MinHeap<Element: Comparable> {
    private var items = [Element]()
    
    public var count: Int {
        items.count
    }
    
    public var isEmpty: Bool {
        items.isEmpty
    }
    
    public var first: Element? {
        items.first
    }
    
    // Insert
    
    public mutating func insert(_ item: Element) {
        items.append(item)
        heapifyUp(from: count-1)
    }
    
    private mutating func heapifyUp(from index: Int) {
        let parent = getParent(index)
        guard parent >= 0 else { return }
        
        if items[index] < items[parent] {
            items.swapAt(index, parent)
            heapifyUp(from: parent)
        }
    }
    
    private func getParent(_ index: Int) -> Int {
        (index - 1) / 2
    }
    
    // Remove first
    
    @discardableResult public mutating func removeFirst() -> Element? {
        guard !isEmpty else { return nil }
        let first = items.removeFirst()
        guard !isEmpty else { return first }
        let last = items.removeLast()
        
        items.insert(last, at: 0)
        heapifyDown(from: 0)
        return first
    }
    
    private mutating func heapifyDown(from index: Int) {
        let left = getLeft(index)
        let right = getRight(index)
        var smallest = index
        
        if left < count, items[left] < items[smallest] {
            smallest = left
        }
        
        if right < count, items[right] < items[smallest] {
            smallest = right
        }
        
        if smallest != index {
            items.swapAt(smallest, index)
            heapifyDown(from: smallest)
        }
    }
    
    private func getLeft(_ index: Int) -> Int {
        (index * 2) + 1
    }
    
    private func getRight(_ index: Int) -> Int {
        (index * 2) + 2
    }
}

let obj = KthLargest(3, [4, 5, 8, 2])
obj.add(3)
obj.add(5)
obj.add(10)
obj.add(9)
obj.add(4)

/*
 ## Binary Search Tree
 */
class TreeNode {
    var val: Int
    var count: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        count = 1
        self.left = left
        self.right = right
    }
}

class KthLargestBST {
    let k: Int
    var root: TreeNode? = nil
    
    private func insert(_ num: Int, _ tree: TreeNode?) -> TreeNode {
        guard let tree = tree else { return TreeNode(num) }
        
        if tree.val > num {
            tree.left = insert(num, tree.left)
        } else if tree.val <  num {
            tree.right = insert(num, tree.right)
        }
        
        tree.count += 1
        
        return tree
    }
    
    private func searchKth(_ node: TreeNode, _ k: Int) -> TreeNode {
        let nodeK = node.count - (node.left?.count ?? 0)
        
        if ((node.right?.count ?? 0) + 1)...nodeK ~= k {
            return node
        } else if nodeK < k {
            return searchKth(node.left!, k - nodeK)
        } else {
            return searchKth(node.right!, k)
        }
    }
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        
        for num in nums {
            root = insert(num, root)
        }
    }
    
    func add(_ val: Int) -> Int {
        root = insert(val, root)
        
        return searchKth(root!, k).val
    }
}

let obj2 = KthLargestBST(3, [4, 5, 8, 2])
obj2.add(3)
obj2.add(5)
obj2.add(10)
obj2.add(9)
obj2.add(4)
