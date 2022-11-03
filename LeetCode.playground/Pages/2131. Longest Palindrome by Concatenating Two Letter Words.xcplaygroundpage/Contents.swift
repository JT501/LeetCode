class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var words = words
        var reversedWords: [String: Int] = [:]
        var central = Set<String>()
        var length = 0
        
        for word in words {
            // if we find a pair of palindrome words
            if reversedWords[word, default: 0] > 0 {
                length += 4
                reversedWords[word]! -= 1
                
                // if it is one of central words
                if central.contains(word) {
                    // Since there is a pair of it,
                    // it cannot be the central word anymore
                    central.remove(word)
                }
            } else {
                if word.first == word.last {
                    // Add the word in one of the central words
                    central.insert(word)
                    // Also increase the occurence of it in hash map
                    reversedWords[word, default: 0] += 1
                } else {
                    // Increase the occurence of the reversed word in hash map
                    reversedWords[String((word).reversed()), default: 0] += 1
                }
            }
        }
        
        return length + (central.isEmpty ? 0 : 2)
    }
}

let s = Solution()

s.longestPalindrome(["lc","cl","gg"])
s.longestPalindrome(["ab","ty","yt","lc","cl","ab"])
s.longestPalindrome(["cc","ll","xx"])
s.longestPalindrome(["nn","nn","hg","gn","nn","hh","gh","nn","nh","nh"])
