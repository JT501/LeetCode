/*:
 ## Depth First Search
 ### Time: O(N+K), where N = number of rooms, K = number of keys
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var n = rooms.count
        var visited = Set<Int>()
        
        func dfs(_ room: Int) -> Bool {
            visited.insert(room)
            
            if visited.count == n {
                return true
            }
            
            for key in rooms[room] {
                if !visited.contains(key), dfs(key) {
                    return true
                }
            }
            return false
        }
        
        return dfs(0)
    }
}

let s = Solution().canVisitAllRooms

s([[2,3],[],[2],[1,3]])
s([[1],[2],[3],[]])
s([[1,3],[3,0,1],[2],[0]])
s([[1,3,2],[2,3],[2,3,1],[]])

/*:
 ## Breadth First Search
 ### Time: O(N+K), where N = number of rooms, K = number of keys
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var n = rooms.count
        var queue: [Int] = []
        var visited = Set<Int>()
        
        queue.append(0)
        visited.insert(0)
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                var curr = queue.removeLast()
                
                if visited.count == n { return true }
                
                for key in rooms[curr] {
                    if !visited.contains(key) {
                        queue.append(key)
                        visited.insert(key)
                    }
                }
            }
        }
        
        return false
    }
}

let s2 = Solution2().canVisitAllRooms

s2([[2,3],[],[2],[1,3]])
s2([[1],[2],[3],[]])
s2([[1,3],[3,0,1],[2],[0]])
s2([[1,3,2],[2,3],[2,3,1],[]])
