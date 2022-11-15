import Foundation

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
            siftDown(elementAtIndex: index)
        }
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        
        return element
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
    
    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFuction(elements[firstIndex], elements[secondIndex])
    }
    
    private func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else { return parentIndex }
        return childIndex
    }
    
    private func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    private mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    private mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
        
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    private mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        
        if index == childIndex { return }
        
        swapElement(at: index, with: childIndex)
        
        siftDown(elementAtIndex: childIndex)
    }
}
