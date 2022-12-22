class Solution {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph = [Int: [Int]]()
        
        for edge in edges {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        
        var count = Array(repeating: 1, count: n)
        var ans = Array(repeating: 0, count: n)
        
        func dfs(_ node: Int, _ parent: Int?) {
            for child in graph[node, default: []] {
                if child != parent {
                    dfs(child, node)
                    count[node] += count[child]
                    ans[node] += ans[child] + count[child]
                }
            }
        }
        
        func dfs2(_ node: Int, _ parent: Int?) {
            for child in graph[node, default: []] {
                if child != parent {
                    ans[child] = ans[node] - count[child] + n - count[child]
                    dfs2(child, node)
                }
            }
        }
        
        dfs(0, nil)
        dfs2(0, nil)
        
        return ans
    }
}

let s = Solution().sumOfDistancesInTree

s(6, [[0,1],[0,2],[2,3],[2,4],[2,5]])
s(1, [])
s(2, [[1,0]])


class Solution2 {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var hashmap = [Int: [Int]]()
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: n), count: n)
        
        for edge in edges {
            hashmap[edge[0], default: []].append(edge[1])
            hashmap[edge[1], default: []].append(edge[0])
            memo[edge[0]][edge[1]] = 1
            memo[edge[1]][edge[0]] = 1
        }
        
        func dfs(_ from: Int, _ to: Int, _ visited: Set<Int>) -> Int? {
            if memo[from][to] != nil {
                return memo[from][to]!
            }
            
            var visited = visited
            visited.insert(from)
            
            var newLength: Int? = nil
            for node in hashmap[from, default: []] where !visited.contains(node) {
                let _newLength = dfs(node, to, visited)
                if _newLength != nil {
                    newLength = _newLength! + 1
                    break
                }
            }
            if newLength != nil {
                memo[from][to] = newLength
                return memo[from][to]!
            }
            
            return nil
        }
        
        var ans = [Int]()
        
        for i in 0..<n {
            var total = 0
            for j in 0..<n where i != j {
                total += dfs(i, j, []) ?? 0
            }
            ans.append(total)
        }
        
        return ans
    }
}

let s2 = Solution2().sumOfDistancesInTree

s2(6, [[0,1],[0,2],[2,3],[2,4],[2,5]])
s2(1, [])
s2(2, [[1,0]])
