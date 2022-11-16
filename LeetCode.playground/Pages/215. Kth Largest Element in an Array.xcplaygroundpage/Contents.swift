/*:
 ## Binary Searh & Quick Sort Partition
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        func lomutoPartition(arr: inout [Int], low: Int, high: Int) -> Int {
            arr.swapAt(Int.random(in: low...high), high)
            
            var pivot = arr[high]
            var i = low
            
            for j in low..<high {
                if arr[j] <= pivot {
                    arr.swapAt(i, j)
                    i += 1
                }
            }
            arr.swapAt(i, high)
            
            return i
        }
        
        var nums = nums
        var k = nums.count - k
        var low = 0, high = nums.count - 1
        
        while low < high {
            let p = lomutoPartition(arr: &nums, low: low, high: high)
            if p > k {
                high = p - 1
            } else if p < k {
                low = p + 1
            } else {
                break
            }
        }
        
        return nums[k]
    }
}

let s = Solution().findKthLargest

s([3,2,1,5,6,4], 2)
s([3,2,3,1,2,4,5,5,6], 4)

/*:
 ## Heap Sort
 ### Time: O(N*log N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap(elements: nums, priorityFunction: >)
        
        for i in (0..<heap.count).reversed() {
            if i == heap.count - 1 - k { break }
            
            heap.swapElement(at: 0, with: i)
            heap.siftDown(elementAtIndex: 0, until: i)
        }
        
        return heap.elements[heap.count - k]
    }
    
    struct Heap<Element> {
        var elements: [Element]
        let priorityFuction: (Element, Element) -> Bool
        
        var isEmpty: Bool {
            return elements.isEmpty
        }
        
        var count: Int {
            return elements.count
        }
        
        init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
            self.elements = elements
            self.priorityFuction = priorityFunction
            buildHeap()
        }
        
        mutating func buildHeap() {
            for index in (0..<count / 2).reversed() {
                siftDown(elementAtIndex: index, until: count)
            }
        }
        
        func isRoot(_ index: Int) -> Bool {
            return (index == 0)
        }
        
        func leftChildIndex(of index: Int) -> Int {
            return (index * 2) + 1
        }
        
        func rightChildIndex(of index: Int) -> Int {
            return (index * 2) + 2
        }
        
        func parentIndex(of index: Int) -> Int {
            return (index - 1) / 2
        }
        
        func peek() -> Element? {
            return elements.first
        }
        
        mutating func enqueue(_ element: Element) {
            elements.append(element)
            siftUp(elementAtIndex: count - 1)
        }
        
        @discardableResult mutating func dequeue() -> Element? {
            guard !isEmpty else { return nil }
            
            swapElement(at: 0, with: count - 1)
            let element = elements.removeLast()
            
            if !isEmpty {
                siftDown(elementAtIndex: 0, until: count)
            }
            
            return element
        }
        
        internal func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
            return priorityFuction(elements[firstIndex], elements[secondIndex])
        }
        
        internal func highestPriorityIndex(of parentIndex: Int, and childIndex: Int, until endIndex: Int) -> Int {
            guard childIndex < endIndex && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
            return childIndex
        }
        
        internal func highestPriorityIndex(for parent: Int, until endIndex: Int) -> Int {
            return highestPriorityIndex(
                of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent), until: endIndex),
                and: rightChildIndex(of: parent),
                until: endIndex
            )
        }
        
        internal mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
            guard firstIndex != secondIndex else { return }
            elements.swapAt(firstIndex, secondIndex)
        }
        
        internal mutating func siftUp(elementAtIndex index: Int) {
            let parent = parentIndex(of: index)
            
            guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
            
            swapElement(at: index, with: parent)
            siftUp(elementAtIndex: parent)
        }
        
        internal mutating func siftDown(elementAtIndex index: Int, until endIndex: Int) {
            let childIndex = highestPriorityIndex(for: index, until: endIndex)
            
            if index == childIndex { return }
            
            swapElement(at: index, with: childIndex)
            
            siftDown(elementAtIndex: childIndex, until: endIndex)
        }
    }
}

let s2 = Solution2().findKthLargest

s2([3,2,1,5,6,4], 2)
s2([3,2,3,1,2,4,5,5,6], 4)
