import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        func getKth(a: [Int], startA: Int, b: [Int], startB: Int, k: Int) -> Double {
            if (startA >= a.count) {
                return Double(b[startB + k - 1])
            }
            if (startB >= b.count) {
                return Double(a[startA + k - 1])
            }
            
            if (k == 1) { return Double(min(a[startA], b[startB]))}
            
            let key1 = startA + k / 2 - 1 >= a.count ? Int.max : a[startA + k / 2 - 1]
            let key2 = startB + k / 2 - 1 >= b.count ? Int.max : b[startB + k / 2 - 1]
            
            if key1 < key2 {
                return getKth(a: a, startA: startA + k / 2, b: b, startB: startB, k: k - k / 2)
            } else {
                return getKth(a: a, startA: startA, b: b, startB: startB + k / 2, k: k - k / 2)
            }
        }
        
        let sum = nums1.count + nums2.count
        
        if sum % 2 == 0 {
            return (
                getKth(a: nums1, startA: 0, b: nums2, startB: 0, k: sum / 2) +
                getKth(a: nums1, startA: 0, b: nums2, startB: 0, k: sum / 2 + 1)
            ) / 2.0
        } else {
            return getKth(a: nums1, startA: 0, b: nums2, startB: 0, k: sum / 2 + 1)
        }
    }
}

Solution().findMedianSortedArrays([3,7,8,8,9], [3,9,9,10])
