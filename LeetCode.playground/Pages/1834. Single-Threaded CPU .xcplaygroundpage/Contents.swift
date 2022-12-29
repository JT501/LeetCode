/*:
 ## Heap
 ### Time: O(N㏒N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func getOrder(_ tasks: [[Int]]) -> [Int] {
        var n = tasks.count
        var heap = Heap(elements: [([Int], Int)]()) { $0.0[1] != $1.0[1] ? $0.0[1] < $1.0[1] : $0.1 < $1.1 }
        var ans = [Int]()
        
        var _tasks = [([Int], Int)]()
        for (i, task) in tasks.enumerated() {
            _tasks.append((task, i))
        }
        _tasks = _tasks.sorted(by: { $0.0[0] < $1.0[0] })
        
        var i = 0
        var time = 1
        while i < n || !heap.isEmpty {
            while i < n && _tasks[i].0[0] <= time {
                heap.enqueue(_tasks[i])
                i += 1
            }
            
            if !heap.isEmpty {
                let task = heap.dequeue()!
                time += task.0[1]
                ans.append(task.1)
            } else {
                time = max(time, _tasks[i].0[0])
            }
        }
        
        return ans
    }
}

let s = Solution().getOrder

s([[1,2],[2,4],[3,2],[4,1]])
s([[7,10],[7,12],[7,5],[7,4],[7,2]])
s([[19,13],[16,9],[21,10],[32,25],[37,4],[49,24],[2,15],[38,41],[37,34],[33,6],[45,4],[18,18],[46,39],[12,24]])
