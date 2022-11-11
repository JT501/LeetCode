/*:
 ## Dutch Flag Problem (Quicksort)
 ### Time: O(n)
 ### Space: O(1)
 ![submission](75-1.png)
 */
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var low = 0, mid = 0, high = nums.count - 1
        
        while mid <= high {
            switch nums[mid] {
            case 0:
                nums.swapAt(low, mid)
                low += 1
                mid += 1
            case 1:
                mid += 1
            case 2:
                nums.swapAt(high, mid)
                high -= 1
            default:
                break
            }
        }
    }
}

/*:
 ## Selection Sort
 ### Time: O(n²)
 ### Space: O(1)
 ![submission](75-2.png)
 */
class Solution2 {
    func sortColors(_ nums: inout [Int]) {
        let len = nums.count
        
        for i in 0..<len {
            var minIndex = i
            for j in (i + 1)..<len {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            let temp = nums[i]
            nums[i] = nums[minIndex]
            nums[minIndex] = temp
        }
    }
}

/*:
 ### Time: O(2n)
 ### Space: O(n)
 ![submission](75-3.png)
 */
class Solution3 {
    func sortColors(_ nums: inout [Int]) {
        let len = nums.count
        var map = [Int: Int]()
        
        for num in nums {
            map[num, default: 0] += 1
        }
        
        nums = []
        
        for i in 0...2 where map[i, default: 0] > 0 {
            for _ in 0..<map[i]! {
                nums.append(i)
            }
        }
    }
}
