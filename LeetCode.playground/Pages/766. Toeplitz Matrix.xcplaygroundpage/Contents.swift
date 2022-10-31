class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        
        for i in 0..<m {
            for j in 0..<n {
                let topLeft = (i - 1, j - 1)
                
                guard topLeft.0 >= 0 && topLeft.1 >= 0 else { continue }
                
                if matrix[topLeft.0][topLeft.1] != matrix[i][j] {
                    return false
                }
            }
        }
        
        return true
    }
}

let s = Solution()

s.isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]])
s.isToeplitzMatrix([[1,2],[2,2]])
