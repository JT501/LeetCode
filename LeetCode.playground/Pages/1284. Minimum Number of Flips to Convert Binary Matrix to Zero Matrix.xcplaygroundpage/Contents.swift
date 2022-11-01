/*
 ## Breadth First Search
 */

class Solution {
    func isZero(_ mat: [[Int]]) -> Bool {
        return mat.flatMap { $0 }.reduce(0, +) == 0
    }
    
    func flip(_ mat: [[Int]], at x: Int, _ y: Int) -> [[Int]] {
        var mat = mat
        let directions = [(0, 0), (-1, 0), (1, 0), (0, -1), (0, 1)]

        for direction in directions {
            let _x = x + direction.0
            let _y = y + direction.1

            guard _x >= 0 && _y >= 0 && _x < mat.count && _y < mat[0].count else { continue }

            mat[_x][_y] = (mat[_x][_y] + 1) % 2
        }
        
        return mat
    }
    
    func minFlips(_ mat: [[Int]]) -> Int {
        var mat = mat
        let m = mat.count
        let n = mat[0].count
        
        var queue: [[[Int]]] = []
        var flipped = Set<[[Int]]>()
        var step = 0
        
        queue.append(mat)
        
        if isZero(mat) { return step }

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                
                if isZero(cur) { return step }
                
                for i in 0..<m {
                    for j in 0..<n {
                        var newMat = flip(cur, at: i, j)
                         
                        if !flipped.contains(newMat) {
                            queue.append(newMat)
                            flipped.insert(newMat)
                        }
                    }
                }
            }
            
            step += 1
        }
        
        return -1
    }
}

let s = Solution()

s.minFlips([[0,0],[0,1]])
s.minFlips([[0]])
s.minFlips([[1,0,0],[1,0,0]])
