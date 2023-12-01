/*:
 ### Time: O(n²)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var n = matrix.count

        // 1st Test Case
        // [0,0] [0,2] [2,2] [2,0]
        // [0,1] [1,2] [2,1] [1,0]

        // 2nd Test Case
        // [0,0] [0,3] [3,3] [3,0]
        // [0,1] [1,3] [3,2] [2,0]
        // [0,2] [2,3] [3,1] [1,0]
        //
        // [1,1] [1,2] [2,2] [2,1]

        for i in (0..<(n/2)) {
            for j in (0..<(n - i*2 - 1)) {
                var temp = matrix[i][i + j]
                matrix[i][i + j] = matrix[n - 1 - i - j][i]
                matrix[n - 1 - i - j][i] = matrix[n - 1 - i][n - 1 - i - j]
                matrix[n - 1 - i][n - 1 - i - j] = matrix[i + j][n - 1 - i]
                matrix[i + j][n - 1 - i] = temp
            }
        }
    }
}
