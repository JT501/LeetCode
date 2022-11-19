/*:
 ## XOR Bit Manipulation
 ![submission](1.png)
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var xor = 0
        for num in nums {
            xor ^= num
        }
        return xor
    }
}

let s = Solution().singleNumber

s([1])
s([2,2,1])
s([4,1,2,1,2])
