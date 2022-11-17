/*:
 ## Snowball
 ### Time: O(n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var snowBallSize = 0
        for i in 0..<nums.count {
            if (nums[i] == 0) {
                snowBallSize += 1
            } else if (snowBallSize > 0) {
                var temp = nums[i]
                nums[i] = 0
                nums[i - snowBallSize] = temp
            }
        }
    }
}

let s = Solution()

var arr = [0,1,0,3,12]
s.moveZeroes(&arr)
print(arr)

/*:
 ## Two Pointers
 ### Time: O(n)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        var start = 0, end = nums.count - 1
        while start < end {
            if nums[start] == 0 {
                nums.append(0)
                nums.remove(at: start)
                end -= 1
            } else {
                start += 1
            }
        }
    }
}

let s2 = Solution2()

var arr2 = [0,1,0,3,12]
s2.moveZeroes(&arr2)
print(arr2)

