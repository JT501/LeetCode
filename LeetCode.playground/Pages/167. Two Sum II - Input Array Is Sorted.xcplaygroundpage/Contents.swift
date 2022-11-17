/*:
 ## Two Pointers
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start = 0, end = numbers.count - 1
        
        while start < end {
            let sum = numbers[start] + numbers[end]
            
            if sum == target {
                break
            } else if sum > target {
                end -= 1
            } else {
                start += 1
            }
        }
        
        return [start + 1, end + 1]
    }
}

let s = Solution()

s.twoSum([2,7,11,15], 9)
s.twoSum([2,3,4], 6)
s.twoSum([1,2,3,4,4,9,56,90], 8)

/*:
 ## Binary Search
 ### Time: O(N*log N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var start = 0, end = numbers.count - 1
        
        while start < end {
            let other = target - numbers[start]
            if let otherIndex = binarySearch(numbers, start + 1, end, other) {
                return [start + 1, otherIndex + 1]
            } else {
                start += 1
            }
        }
        
        func binarySearch(_ numbers:[Int], _ start: Int, _ end: Int, _ target: Int) -> Int? {
            guard start <= end else { return nil }
            
            let mid = start + (end - start) / 2
            
            if numbers[mid] == target {
                return mid
            } else if numbers[mid] < target {
                return binarySearch(numbers, mid + 1, end, target)
            } else if numbers[mid] > target {
                return binarySearch(numbers, start, mid - 1, target)
            }
            
            return nil
        }
        
        return []
    }
}

let s2 = Solution2()

s2.twoSum([2,7,11,15], 9)
s2.twoSum([2,3,4], 6)
s2.twoSum([1,2,3,4,4,9,56,90], 8)
