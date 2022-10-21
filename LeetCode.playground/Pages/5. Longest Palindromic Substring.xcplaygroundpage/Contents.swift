class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        var chars = Array(s)
        var left = 0, right = 0
        
        for i in 0..<s.count {
            let oddLength = getPalindromeLength(chars, start: i, end: i)
            let evenLength = getPalindromeLength(chars, start: i, end: i + 1)
            let longerLength = max(oddLength, evenLength)
            
            if longerLength > (right - left + 1) {
                left = i - (longerLength - 1) / 2
                right = i + (longerLength) / 2
            }
        }
        
        return String(chars[left...right])
    }
    
    private func getPalindromeLength(_ chars: [Character], start: Int, end: Int) -> Int {
        var start = start
        var end = end
        
        while start >= 0 && end < chars.count && chars[start] == chars[end] {
            start -= 1
            end += 1
        }
        
        return end - start + 1 - 2
    }
}

let s = Solution()

//s.longestPalindrome("ecbababcf")
//s.longestPalindrome("babad")
//s.longestPalindrome("cbbd")
//s.longestPalindrome("a")
//s.longestPalindrome("ac")
//s.longestPalindrome("bb")
//s.longestPalindrome("aaaa")
//s.longestPalindrome("abcda")
s.longestPalindrome("ibvjkmpyzsifuxcabqqpahjdeuzaybqsrsmbfplxycsafogotliyvhxjtkrbzqxlyfwujzhkdafhebvsdhkkdbhlhmaoxmbkqiwiusngkbdhlvxdyvnjrzvxmukvdfobzlmvnbnilnsyrgoygfdzjlymhprcpxsnxpcafctikxxybcusgjwmfklkffehbvlhvxfiddznwumxosomfbgxoruoqrhezgsgidgcfzbtdftjxeahriirqgxbhicoxavquhbkaomrroghdnfkknyigsluqebaqrtcwgmlnvmxoagisdmsokeznjsnwpxygjjptvyjjkbmkxvlivinmpnpxgmmorkasebngirckqcawgevljplkkgextudqaodwqmfljljhrujoerycoojwwgtklypicgkyaboqjfivbeqdlonxeidgxsyzugkntoevwfuxovazcyayvwbcqswzhytlmtmrtwpikgacnpkbwgfmpavzyjoxughwhvlsxsgttbcyrlkaarngeoaldsdtjncivhcfsaohmdhgbwkuemcembmlwbwquxfaiukoqvzmgoeppieztdacvwngbkcxknbytvztodbfnjhbtwpjlzuajnlzfmmujhcggpdcwdquutdiubgcvnxvgspmfumeqrofewynizvynavjzkbpkuxxvkjujectdyfwygnfsukvzflcuxxzvxzravzznpxttduajhbsyiywpqunnarabcroljwcbdydagachbobkcvudkoddldaucwruobfylfhyvjuynjrosxczgjwudpxaqwnboxgxybnngxxhibesiaxkicinikzzmonftqkcudlzfzutplbycejmkpxcygsafzkgudy"
)
//s.longestPalindrome("cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc")





class SolutionDP {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        
        var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        
        var result = (left: 0, right: 0)
        
        var chars: [Character] = Array(s)
        
        for j in 1..<s.count {
            for i in 0...j {
                if isPalindromes(chars, dp: dp, start: i, end: j) {
                    dp[i][j] = true
                    if j - i > result.right - result.left {
                        result = (left: i, right: j)
                    }
                }
            }
        }
        
        return String(chars[result.left...result.right])
    }
    
    private func isPalindromes(_ chars:[Character], dp: [[Bool]], start: Int, end: Int) -> Bool {
        if start == end {
            return true
        }
        if end == start + 1 {
            return chars[start] == chars[end]
        }
        if dp[start + 1][end - 1] {
            return chars[start] == chars[end]
        }
        return false
    }
}

let s2 = SolutionDP()

s2.longestPalindrome("ecbababcf")
s2.longestPalindrome("babad")
s2.longestPalindrome("cbbd")
s2.longestPalindrome("a")
s2.longestPalindrome("ac")
s2.longestPalindrome("bb")
s2.longestPalindrome("aaaa")
s2.longestPalindrome("abcda")
s2.longestPalindrome("ibvjkmpyzsifuxcabqqpahjdeuzaybqsrsmbfplxycsafogotliyvhxjtkrbzqxlyfwujzhkdafhebvsdhkkdbhlhmaoxmbkqiwiusngkbdhlvxdyvnjrzvxmukvdfobzlmvnbnilnsyrgoygfdzjlymhprcpxsnxpcafctikxxybcusgjwmfklkffehbvlhvxfiddznwumxosomfbgxoruoqrhezgsgidgcfzbtdftjxeahriirqgxbhicoxavquhbkaomrroghdnfkknyigsluqebaqrtcwgmlnvmxoagisdmsokeznjsnwpxygjjptvyjjkbmkxvlivinmpnpxgmmorkasebngirckqcawgevljplkkgextudqaodwqmfljljhrujoerycoojwwgtklypicgkyaboqjfivbeqdlonxeidgxsyzugkntoevwfuxovazcyayvwbcqswzhytlmtmrtwpikgacnpkbwgfmpavzyjoxughwhvlsxsgttbcyrlkaarngeoaldsdtjncivhcfsaohmdhgbwkuemcembmlwbwquxfaiukoqvzmgoeppieztdacvwngbkcxknbytvztodbfnjhbtwpjlzuajnlzfmmujhcggpdcwdquutdiubgcvnxvgspmfumeqrofewynizvynavjzkbpkuxxvkjujectdyfwygnfsukvzflcuxxzvxzravzznpxttduajhbsyiywpqunnarabcroljwcbdydagachbobkcvudkoddldaucwruobfylfhyvjuynjrosxczgjwudpxaqwnboxgxybnngxxhibesiaxkicinikzzmonftqkcudlzfzutplbycejmkpxcygsafzkgudy"
)

