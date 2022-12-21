class Solution {
    struct UnionFind {
        private var index = [Int: Int]()
        private var parent  = [Int]()
        private var size = [Int]()
        
        mutating func add(_ element: Int) {
            index[element] = parent.count
            parent.append(parent.count)
            size.append(1)
        }
        
        mutating func find(_ element: Int) -> Int? {
            if let indexOfElement = index[element] {
                return setByIndex(indexOfElement)
            } else {
                return nil
            }
        }
        
        private mutating func setByIndex(_ index: Int) -> Int {
            if parent[index] == index {
                return index
            } else {
                parent[index] = setByIndex(parent[index])
                return parent[index]
            }
        }
        
        mutating func isSameSet(_ first: Int, and second: Int) -> Bool {
            if let firstSet = find(first), let secondSet = find(second) {
                return firstSet == secondSet
            } else {
                return false
            }
        }
        
        mutating func unionSet(_ first: Int, and second: Int) {
            if let firstSet = find(first), let secondSet = find(second) {
                if firstSet != secondSet {
                    if size[firstSet] < size[secondSet] {
                        parent[firstSet] = secondSet
                        size[secondSet] += size[firstSet]
                    } else {
                        parent[secondSet] = firstSet
                        size[firstSet] += size[secondSet]
                    }
                }
            }
        }
    }
    
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var hashmap = [Int: [Int]]()
        var union = UnionFind()
        
        for dislike in dislikes {
            hashmap[dislike[0], default: []].append(dislike[1])
            hashmap[dislike[1], default: []].append(dislike[0])
        }
        
        for i in 1...n {
            union.add(i)
        }
        
        for i in 1...n {
            for j in hashmap[i, default:[]] {
                if union.isSameSet(i, and: j) { return false }
                union.unionSet(hashmap[i]![0], and: j)
            }
        }
        
        return true
    }
}

let s = Solution().possibleBipartition

s(4, [[1,2],[1,3],[2,4]])
s(3, [[1,2],[1,3],[2,3]])
s(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])
s(5, [[1,2],[1,3],[1,4],[1,5]])
s(1, [])

/*:
 ## Depth First Search
 ### Time: O(N+E), where N = number of people, E = size of dislikes
 ### Space: O(N+E)
 ![submission](2.png)
 */
class Solution2 {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var hashmap = [Int: Set<Int>]()
        var color = Array(repeating: -1, count: n+1)
        
        for dislike in dislikes {
            hashmap[dislike[0], default: []].insert(dislike[1])
            hashmap[dislike[1], default: []].insert(dislike[0])
        }
        
        func dfs(_ node: Int, _ nodeColor: Int) -> Bool {
            color[node] = nodeColor
            for neighbor in hashmap[node, default: []] {
                if color[node] == color[neighbor] { return false }
                if color[neighbor] == -1 {
                    if !dfs(neighbor, 1 - color[node]) { return false }
                }
            }
            
            return true
        }
        
        for i in 1...n {
            if color[i] == -1 {
                if !dfs(i, 0) { return false }
            }
        }

        return true
    }
}

let s2 = Solution2().possibleBipartition

s2(4, [[1,2],[1,3],[2,4]])
s2(3, [[1,2],[1,3],[2,3]])
s2(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])
s2(5, [[1,2],[1,3],[1,4],[1,5]])



/*:
 ## Breadth First Search
 ### Time: O(N+E), where N = number of people, E = size of dislikes
 ### Space: O(N+E)
 ![submission](3.png)
 */
class Solution3 {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var hashmap = [Int: Set<Int>]()
        var color = Array(repeating: -1, count: n+1)
        
        for dislike in dislikes {
            hashmap[dislike[0], default: []].insert(dislike[1])
            hashmap[dislike[1], default: []].insert(dislike[0])
        }
        
        for i in 1...n {
            if color[i] == -1 {
                var queue = [Int]()
                
                queue.append(i)
                color[i] = 0
                
                while !queue.isEmpty {
                    
                    for _ in 0..<queue.count {
                        let curr = queue.removeLast()
                        
                        for neighbor in hashmap[curr, default: []] {
                            if color[neighbor] == color[curr] { return false }
                            if color[neighbor] == -1 {
                                color[neighbor] = 1 - color[curr]
                                queue.append(neighbor)
                            }
                        }
                    }
                }
            }
        }
        
        return true
    }
}

let s3 = Solution3().possibleBipartition

s3(4, [[1,2],[1,3],[2,4]])
s3(3, [[1,2],[1,3],[2,3]])
s3(5, [[1,2],[2,3],[3,4],[4,5],[1,5]])
s3(5, [[1,2],[1,3],[1,4],[1,5]])

