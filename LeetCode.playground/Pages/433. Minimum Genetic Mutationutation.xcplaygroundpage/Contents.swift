class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        let chars: [Character] = ["A", "C", "G", "T"]
        
        var queue = [String]()
        var visited = Set<String>()
        var step = 0
        
        queue.append(start)
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                
                if cur == end {
                    return step
                }
                
                for i in 0..<8 {
                    for j in 0..<4 {
                        var arr = Array(cur)
                        
                        arr[i] = chars[j]
                        let newString = String(arr)
                        
                        if !visited.contains(newString) && bank.contains(newString) {
                            queue.append(newString)
                            visited.insert(newString)
                        }
                    }
                }
            }
            step += 1
        }
        
        return -1
    }
}

let s = Solution()

s.minMutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"])
s.minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"])
s.minMutation("AAAAACCC", "AACCCCCC", ["AAAACCCC","AAACCCCC","AACCCCCC"])
