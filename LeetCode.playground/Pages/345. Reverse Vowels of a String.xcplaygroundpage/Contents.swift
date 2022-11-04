class Solution {
    func reverseVowels(_ s: String) -> String {
        let vowels: Set<Character> = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]
        var arr = Array(s)
        var start = 0
        var end = s.count - 1
        
        while start < end {
            if vowels.contains(arr[start]) && vowels.contains(arr[end]) {
                arr.swapAt(start, end)
                start += 1
                end -= 1
            } else if vowels.contains(arr[start]) {
                end -= 1
            } else if vowels.contains(arr[end]) {
                start += 1
            } else {
                start += 1
                end -= 1
            }
        }
        
        return String(arr)
    }
}

let s = Solution()

s.reverseVowels("hello")
s.reverseVowels("leetcode")
