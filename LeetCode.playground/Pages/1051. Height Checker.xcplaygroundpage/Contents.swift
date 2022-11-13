/*:
 ## Counting Sort
 ### Time: O(n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = Array(repeating: 0, count: 101)
        var ans = 0
        
        for height in heights {
            count[height] += 1
        }
        
        var i = 1, j = 0
        
        while i < 101 {
            if count[i] == 0 {
                i += 1
            } else {
                if i != heights[j] {
                    ans += 1
                }
                j += 1
                count[i] -= 1
            }
        }
        
        return ans
    }
}

let s = Solution()

s.heightChecker([1,1,4,2,1,3])
s.heightChecker([5,1,2,3,4])
s.heightChecker([1,2,3,4,5])

/*:
 ## Bubble Sort
 ### Time: O(n²)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func heightChecker(_ heights: [Int]) -> Int {
        var h = heights
        var swapped = true
        var ans = 0
        
        while swapped {
            swapped = false
            
            for i in 0..<(h.count - 1) {
                if h[i] > h[i + 1] {
                    (h[i], h[i + 1]) = (h[i + 1], h[i])
                    swapped = true
                }
            }
        }
        
        for (i, height) in heights.enumerated() {
            if height != h[i] {
                ans += 1
            }
        }
        return ans
    }
}

let s2 = Solution2()

s2.heightChecker([1,1,4,2,1,3])
s2.heightChecker([5,1,2,3,4])
s2.heightChecker([1,2,3,4,5])

/*:
 ## Built-in Sorting
 ### Time: O(n log n)
 ### Space: O(n)
 ![submission](3.png)
 */
class Solution3 {
    func heightChecker(_ heights: [Int]) -> Int {
        let sorted = heights.sorted()
        var ans = 0
        
        for (i, height) in heights.enumerated() {
            if height != sorted[i] {
                ans += 1
            }
        }
        
        return ans
    }
}

let s3 = Solution3()

s3.heightChecker([1,1,4,2,1,3])
s3.heightChecker([5,1,2,3,4])
s3.heightChecker([1,2,3,4,5])
