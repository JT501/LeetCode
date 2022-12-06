/*:
 ## Breath First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var queue = [(n: Int, path: [Int])]()
        var target = graph.count - 1
        var ans = [[Int]]()
        
        queue.append((0, [0]))
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (current, path) = queue.removeFirst()
                
                if current == target {
                    ans.append(path)
                    continue
                }
                
                graph[current].forEach { i in
                    var newPath = path
                    newPath.append(i)
                    queue.append((i, newPath))
                }
            }
        }
        
        return ans
    }
}

let s = Solution().allPathsSourceTarget

s([[1,2],[3],[3],[]])
s([[4,3,1],[3,2,4],[3],[4],[]])

/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var target = graph.count - 1
        var ans = [[Int]]()
        
        func dfs(_ n: Int, _ path: [Int]) {
            var path = path
            path.append(n)
            
            if n == target {
                ans.append(path)
                return
            }
            
            graph[n].forEach { i in
                dfs(i, path)
            }
        }
        
        dfs(0, [])
        
        return ans
    }
}

let s2 = Solution2().allPathsSourceTarget

s2([[1,2],[3],[3],[]])
s2([[4,3,1],[3,2,4],[3],[4],[]])
