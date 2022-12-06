/*:
 ## Backtracking
 ### Time: O(N*2^N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        guard !graph.isEmpty else { return [] }
        
        let target = graph.count - 1
        
        var stack: [Int] = []
        var result: [[Int]] = []
        
        func dfs(n: Int) {
            guard n != target else {
                result.append(stack + [target])
                return
            }
            for i in graph[n] {
                stack.append(n)
                dfs(n: i)
                stack.removeLast()
            }
        }
        dfs(n: 0)
        return result
    }
}

/*:
 ## Breath First Search
 ### Time: O(N*2^N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
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

let s2 = Solution2().allPathsSourceTarget

s2([[1,2],[3],[3],[]])
s2([[4,3,1],[3,2,4],[3],[4],[]])

/*:
 ## Depth First Search
 ### Time: O(N*2^N)
 ### Space: O(N)
 ![submission](3.png)
 */
class Solution3 {
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

let s3 = Solution3().allPathsSourceTarget

s3([[1,2],[3],[3],[]])
s3([[4,3,1],[3,2,4],[3],[4],[]])
