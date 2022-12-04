/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let m = isConnected.count
        var visited = Set<Int>()
        var provinces = 0
        
        for i in 0..<m {
            if !visited.contains(i) {
                provinces += 1
                dfs(i)
            }
        }
        
        func dfs(_ i: Int) {
            visited.insert(i)
            
            for y in 0..<m {
                if isConnected[i][y] == 1 && !visited.contains(y) {
                    dfs(y)
                }
            }
        }
        
        return provinces
    }
}

let s = Solution().findCircleNum

s([[1,1,0],[1,1,0],[0,0,1]])
s([[1,0,0],[0,1,0],[0,0,1]])
s([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])


/*:
 ## Breath First Search
 ### Time: O(M*N)
 ### Space: O(min(M,N))
 ![submission](2.png)
 */
class Solution2 {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let m = isConnected.count, n = isConnected[0].count
        var queue = [Int]()
        var visited = Set<Int>()
        var provinces = 0
        
        for i in 0..<m {
            if !visited.contains(i) {
                provinces += 1
                
                queue.append(i)
                
                while !queue.isEmpty {
                    for _ in 0..<queue.count {
                        let current = queue.removeFirst()
                        visited.insert(current)
                        
                        for y in 0..<n {
                            if isConnected[current][y] == 1 && !visited.contains(y) {
                                queue.append(y)
                            }
                        }
                    }
                }
            }
        }
        
        return provinces
    }
}

let s2 = Solution2().findCircleNum

s2([[1,1,0],[1,1,0],[0,0,1]])
s2([[1,0,0],[0,1,0],[0,0,1]])
s2([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])
