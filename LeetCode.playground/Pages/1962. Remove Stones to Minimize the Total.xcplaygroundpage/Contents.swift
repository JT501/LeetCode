class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
        var heap = Heap(elements: piles, priorityFunction: >)
        
        for _ in 1...k {
            var new = heap.dequeue()!
            new -= new / 2
            heap.enqueue(new)
        }
        
        return heap.elements.reduce(0, +)
    }
}

let s = Solution().minStoneSum

s([5,4,9], 2)
s([4,3,6,7], 3)
