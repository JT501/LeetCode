/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        
        func fill(_ i: Int, _ j: Int, _ startColor: Int) {
            if i < 0 || j < 0 || i >= image.count || j >= image[i].count {
                return
            }
            
            if image[i][j] == startColor && image[i][j] != color {
                image[i][j] = color
                // North
                fill(i - 1, j, startColor)
                // South
                fill(i + 1, j, startColor)
                // East
                fill(i, j + 1, startColor)
                // West
                fill(i, j - 1, startColor)
            }
        }
        
        fill(sr, sc, image[sr][sc])
        
        return image
    }
}

let s = Solution()

s.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
s.floodFill([[0,0,0],[0,0,0]], 0, 0, 0)
