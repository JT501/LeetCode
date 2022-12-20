/*:
 ## Depth First Search
 ### Time: O(M+N), where M = number of nodes, N = number of edges
 ### Space: O(M+N)
 ![submission](1.png)
 */
class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var hashmap = [Int: Set<Int>]()
        var visited = Set<Int>()
        
        for edge in edges {
            hashmap[edge[0], default: []].insert(edge[1])
            hashmap[edge[1], default: []].insert(edge[0])
        }
        
        func dfs(_ from: Int, _ to: Int) -> Bool {
            if from == to { return true }
            
            visited.insert(from)
            
            for next in hashmap[from, default: []] {
                if !visited.contains(next), dfs(next, to) {
                    return true
                }
            }
            hashmap.removeValue(forKey: from)
            
            return false
        }
        
        return dfs(source, destination)
    }
}

let s = Solution().validPath

s(3, [[0,1],[1,2],[2,0]], 0, 2)
s(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5)
s(10, [[0,7],[0,8],[6,1],[2,0],[0,4],[5,8],[4,7],[1,3],[3,5],[6,5]], 7, 5)
s(1, [], 0, 0)

/*:
 ## Breadth First Search
 ### Time: O(M+N), where M = number of nodes, N = number of edges
 ### Space: O(M+N)
 ![submission](2.png)
 */
class Solution2 {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var queue = [Int]()
        var visited = Array(repeating: false, count: n)
        var hashmap = [Int: Set<Int>]()
        
        for edge in edges {
            hashmap[edge[0], default: []].insert(edge[1])
            hashmap[edge[1], default: []].insert(edge[0])
        }
        
        queue.append(source)
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let curr = queue.removeLast()
                visited[curr] = true
                
                if curr == destination { return true }
                
                let nexts = hashmap[curr]!
                
                for next in nexts {
                    if !visited[next] {
                        queue.append(next)
                    }
                }
            }
        }
        
        return false
    }
}

let s2 = Solution2().validPath

s2(3, [[0,1],[1,2],[2,0]], 0, 2)
s2(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5)
s2(10, [[0,7],[0,8],[6,1],[2,0],[0,4],[5,8],[4,7],[1,3],[3,5],[6,5]], 7, 5)
s2(1, [], 0, 0)
