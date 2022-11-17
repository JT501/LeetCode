/*:
 ### Time: O(n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var length = nums.count
        var step = k % length
        if step == 0 { return }
        reverse(&nums, 0, length - 1)
        reverse(&nums, 0, step - 1)
        reverse(&nums, step, length - 1)
        
    }
    
    private func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
}

let s = Solution()

var arr = [1,2]
s.rotate(&arr, 3)
print(arr)

/*:
 ### Time: O(n)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var i = 1
        var count = k % nums.count
        while i <= count {
            nums.insert(nums[nums.count - 1], at: 0)
            nums.removeLast()
            
            i += 1
        }
    }
}

let s2 = Solution2()

var arr3 = [1,2,3,4,5,6,7]
s2.rotate(&arr3, 3)
print(arr3)

var arr4 = [1,2]
s2.rotate(&arr4, 3)
print(arr4)

/*:
 ### Time: O(1)
 ### Space: O(1)
 ![submission](3.png)
 */
class Solution3 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var step = k % nums.count
        if step > 0 {
            nums = Array(nums[nums.count - step..<nums.count]) + Array(nums[0..<nums.count - step])
        }
    }
}

let s3 = Solution3()

var arr1 = [1,2,3,4,5,6,7]
s3.rotate(&arr1, 3)
print(arr1)

var arr2 = [1,2]
s3.rotate(&arr2, 3)
print(arr2)
