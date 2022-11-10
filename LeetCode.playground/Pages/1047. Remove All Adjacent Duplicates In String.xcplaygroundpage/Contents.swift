class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack = [Character]()
        
        for char in s {
            if !stack.isEmpty && stack.last! == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        return String(stack)
    }
}

let s = Solution()

s.removeDuplicates("abbaca")
s.removeDuplicates("azxxzy")
