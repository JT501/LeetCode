/*:
 ## Depth First Search
 ### Time: O(26*N)
 ### Space: O(26*N)
 ![submission](1.png)
 */
class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var hashMap = [Int:[Int]]()
        var labels = Array(labels)
        var ans = Array(repeating: 0, count: n)
        
        for edge in edges {
            hashMap[edge[0], default: []].append(edge[1])
            hashMap[edge[1], default: []].append(edge[0])
        }
        
        func dfs(_ node: Int, _ parent: Int) -> [Int] {
            var counter = Array(repeating: 0, count: 26)
            var letterIndex = letterToIndex(labels[node])
            
            counter[letterIndex] += 1
            
            for child in hashMap[node, default: []] {
                if child == parent {
                    continue
                }
                counter = zip(counter, dfs(child, node)).map(+)
            }
            
            ans[node] = counter[letterIndex]
            
            return counter
        }
        
        dfs(0, -1)
        
        return ans
    }
    
    func letterToIndex(_ char: Character) -> Int {
        return Int(Character(char.lowercased()).asciiValue!) - 97
    }
}

let s = Solution().countSubTrees

s(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], "abaedcd")
s(4, [[0,1],[1,2],[0,3]], "bbbb")
s(5, [[0,1],[0,2],[1,3],[0,4]], "aabab")
s(4, [[0,2],[0,3],[1,2]], "aeed")


/*:
 ## Breadth First Search
 ### Time: O(26*N)
 ### Space: O(26*N)
 ![submission](2.png)
 */
class Solution2 {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var hashMap = [Int:Set<Int>]()
        var labels = Array(labels)
        var ans = Array(repeating: 0, count: n)
        
        for edge in edges {
            hashMap[edge[0], default: []].insert(edge[1])
            hashMap[edge[1], default: []].insert(edge[0])
        }
        
        var count = Array(repeating: Array(repeating: 0, count: 26), count: n)
        var queue = [Int]()
        
        for i in 0..<n {
            count[i][letterToIndex(labels[i])] = 1
            if i != 0 && hashMap[i, default: []].count == 1 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            let parent = hashMap[node, default: []].first!
            
            hashMap[parent]?.remove(node)
            
            for i in 0..<26 {
                count[parent][i] += count[node][i]
            }
            
            if parent != 0 && hashMap[parent, default: []].count == 1 {
                queue.append(parent)
            }
        }
        
        for i in 0..<n {
            ans[i] = count[i][letterToIndex(labels[i])]
        }
        
        return ans
    }
    
    func letterToIndex(_ char: Character) -> Int {
        return Int(Character(char.lowercased()).asciiValue!) - 97
    }
}

let s2 = Solution2().countSubTrees

s2(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], "abaedcd")
s2(4, [[0,1],[1,2],[0,3]], "bbbb")
s2(5, [[0,1],[0,2],[1,3],[0,4]], "aabab")
s2(4, [[0,2],[0,3],[1,2]], "aeed")
