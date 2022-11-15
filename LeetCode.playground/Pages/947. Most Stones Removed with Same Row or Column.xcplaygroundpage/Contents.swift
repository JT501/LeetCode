/*:
 ## Union Find
 ### Time: O(n²)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    
    class UnionFind {
        var parent: [Int]
        var size: [Int]
        
        init(_ n: Int) {
            parent = Array(0..<n)
            size = Array(repeating: 1, count: n)
        }
        
        func find(_ i: Int) -> Int {
            if parent[i] != i {
                parent[i] = find(parent[i])
            }
            return parent[i]
        }
        
        func union(_ x: Int, _ y: Int) -> Bool {
            let xParent = find(x), yParent = find(y)
            
            if xParent == yParent {
                return false
            }
            
            if size[xParent] <= size[yParent] {
                parent[xParent] = yParent
                size[yParent] += size[xParent]
            } else {
                parent[yParent] = xParent
                size[xParent] += size[yParent]
            }
            
            return true
        }
    }
    
    func removeStones(_ stones: [[Int]]) -> Int {
        var uf = UnionFind(stones.count)
        
        for i in 0..<stones.count {
            for j in (i + 1)..<stones.count {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    uf.union(i, j)
                }
            }
        }
        
        return stones.count - uf.parent.enumerated().filter{ $0.offset == $0.element }.count
    }
}

let s = Solution().removeStones

s([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]])
s([[0,0],[0,2],[1,1],[2,0],[2,2]])
s([[3,2],[0,0],[3,3],[2,1],[2,3],[2,2],[0,2]])
s([[0,0],[0,2],[1,1],[2,0],[2,2]])
s([[5,9],[9,0],[0,0],[7,0],[4,3],[8,5],[5,8],[1,1],[0,6],[7,5],[1,6],[1,9],[9,4],[2,8],[1,3],[4,2],[2,5],[4,1],[0,2],[6,5]])


/*:
 ## Depth First Search
 ### Time: O(n²)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func removeStones(_ stones: [[Int]]) -> Int {
        var visited = Set<[Int]>()
        var noOfIsland = 0
        
        for stone in stones {
            if !visited.contains(stone) {
                dfs(stone)
                noOfIsland += 1
            }
        }
        
        func dfs(_ stone: [Int]) {
            visited.insert(stone)
            
            for nextStone in stones {
                guard nextStone.first == stone.first || nextStone.last == stone.last else {
                    continue
                }
                
                if !visited.contains(nextStone) {
                    dfs(nextStone)
                }
            }
        }
        
        return stones.count - noOfIsland
    }
}

let s2 = Solution2()

s2.removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]])
s2.removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]])
s2.removeStones([[3,2],[0,0],[3,3],[2,1],[2,3],[2,2],[0,2]])
s2.removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]])
s2.removeStones([[5,9],[9,0],[0,0],[7,0],[4,3],[8,5],[5,8],[1,1],[0,6],[7,5],[1,6],[1,9],[9,4],[2,8],[1,3],[4,2],[2,5],[4,1],[0,2],[6,5]])
