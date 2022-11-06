/*:
 ## Bubble Sort
 */
class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        var chars = Array(s)
        
        if k > 1 {
            return String(chars.sorted())
        } else {
            var ans = s
            for i in 0..<chars.count {
                ans = min(ans, String(chars[i...] + chars[..<i]))
            }
            return ans
        }
    }
}
