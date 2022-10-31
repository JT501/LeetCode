class Solution { 
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let slots: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        func rotateSlots(from slot: Character, right: Bool = true) -> Character {
            let int = slot.wholeNumberValue!
            if right {
                return slots[(int + 1 + 10) % 10]
            } else {
                return slots[(int - 1 + 10) % 10]
            }
        }
        
        var queue: [String] = []
        var visited: Set<String> = Set(deadends)
        var step = 0
        
        queue.append("0000")
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                
                if visited.contains(cur) {
                    continue
                } else {
                    visited.insert(cur)
                }
                
                if cur == target { return step }
                
                for i in 0..<4 {
                    for direction in [true, false] {
                        var curArr = Array(cur)
                        
                        // Rotate
                        curArr[i] = rotateSlots(from: curArr[i], right: direction)
                        let newWheels = String(curArr)
                        
                        if !visited.contains(newWheels) {
                            queue.append(newWheels)
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

s.openLock(["0201","0101","0102","1212","2002"], "0202")
//s.openLock(["8888"], "0009")
//s.openLock(["0000"], "8888")
//s.openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888")
