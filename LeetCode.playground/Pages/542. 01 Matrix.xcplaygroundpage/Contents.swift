/*:
 ## Dynamic Programming
 ### Time: O(M*N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        var mat = mat
        
        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 0 { continue }
                
                let top = (i - 1) >= 0 ? mat[i - 1][j] : m + n
                let left = (j - 1) >= 0 ? mat[i][j - 1] : m + n

                mat[i][j] = min(top, left) + 1
            }
        }
        
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                if mat[i][j] == 0 { continue }
                
                let bottom = i + 1 < m ? mat[i + 1][j] : m + n
                let right = j + 1 < n ? mat[i][j + 1] : m + n

                mat[i][j] = min(mat[i][j], min(bottom, right) + 1)
            }
        }
        
        return mat
    }
}

let s = Solution().updateMatrix

s([[0,0,0],[0,1,0],[0,0,0]])
s([[0,0,0],[0,1,0],[1,1,1]])
s([[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[0,0,0]])

/*:
 ## Breadth First Search
 ### Time: O(M*N)
 ### Space: O(M*N)
 ![submission](2.png)
 */
class Solution2 {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let m = mat.count
        let n = mat[0].count
        var mat = mat
        var queue = [(Int, Int)]()
        let directions = [(-1,0),(1,0),(0,-1),(0,1)]
        
        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 0 {
                    queue.append((i,j))
                } else {
                    mat[i][j] = -1
                }
            }
        }
        
        while !queue.isEmpty {
            let (i,j) = queue.removeFirst()
            
            for direction in directions {
                let x = i + direction.0
                let y = j + direction.1
                
                guard x >= 0 && y >= 0 && x < m && y < n else { continue }
                
                if mat[x][y] == -1 {
                    mat[x][y] = mat[i][j] + 1
                    queue.append((x,y))
                }
            }
        }
        
        return mat
    }
}

let s2 = Solution2().updateMatrix

s2([[0,0,0],[0,1,0],[0,0,0]])
s2([[0,0,0],[0,1,0],[1,1,1]])
s2([[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[1,1,1],[0,0,0]])
