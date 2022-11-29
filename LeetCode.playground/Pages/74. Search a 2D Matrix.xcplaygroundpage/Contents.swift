/*:
 ## Binary Search
 ### Time: O(log N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        
        var start = 0, end = m*n-1
        
        while start <= end {
            let mid = start + (end - start) / 2
            let x = mid / n
            let y = mid % n
            
            if matrix[x][y] == target {
                return true
            }
            if matrix[x][y] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return false
    }
}

let s = Solution().searchMatrix

s([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
s([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13)
