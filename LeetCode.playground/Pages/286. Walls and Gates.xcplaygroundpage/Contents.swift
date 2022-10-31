/*:
 ## Breadth First Search
 */

class Solution {
    func wallsAndGates(_ rooms: [[Int]]) -> [[Int]] {
        var rooms = rooms
        let rowSize = rooms.count
        guard rowSize > 1 else { return rooms }
        let colSize = rooms[0].count
        guard colSize > 1 else { return rooms }
        
        let GATE = 0, WALL = -1, ROOM = Int.max
        var queue: [(Int, Int)] = []
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var step = 0
        
        for i in 0..<rowSize {
            for j in 0..<colSize {
                if rooms[i][j] == GATE {
                    queue.append((i, j))
                }
            }
        }
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                var cur = queue.removeFirst()
                if rooms[cur.0][cur.1] == ROOM {
                    rooms[cur.0][cur.1] = step
                }
                
                for direction in directions {
                    let i = cur.0 + direction.0
                    let j = cur.1 + direction.1
                    
                    guard i >= 0 && j >= 0 && i < rowSize && j < colSize else { continue }
                    
                    if rooms[i][j] == WALL || rooms[i][j] >= 0 && rooms[i][j] < ROOM {
                        continue
                    } else {
                        queue.append((i, j))
                    }
                }
            }
            step += 1
        }
        
        return rooms
    }
}

let s = Solution()

s.wallsAndGates([[Int.max, -1, 0, Int.max], [Int.max, Int.max, Int.max, -1], [Int.max, -1, Int.max, -1], [0, -1, Int.max, Int.max]])
