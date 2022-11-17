/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // Counting String in Swift is O(n), saving it in var save lot of time
        let s1Length = s1.count
        guard s2.count >= s1Length else { return false }
        
        var s2 = Array(s2)
        var s1Chars = Array(repeating: 0, count: 26)
        var count = s1Length
        
        s1.forEach { s1Chars[alphaIndex($0)] += 1 }
        
        var left = 0
        for (right, char) in s2.enumerated() {
            s1Chars[alphaIndex(char)] -= 1
            
            if s1Chars[alphaIndex(char)] >= 0 {
                count -= 1
            }
            if right - left + 1 > s1Length {
                s1Chars[alphaIndex(s2[left])] += 1
                if s1Chars[alphaIndex(s2[left])] >= 1 { count += 1 }
                left += 1
            }
            if count == 0 { return true }
        }
        
        return false
    }
    
    private func alphaIndex(_ c: Character) -> Int {
        Int(c.asciiValue! - Character("a").asciiValue!)
    }
}

let s = Solution3()

s.checkInclusion("ab", "eidbaooo")
s.checkInclusion("ab", "eidboaoo")
s.checkInclusion("e", "eidboaoo")
s.checkInclusion("bid", "eidboaoo")
s.checkInclusion("hello", "ooolleoooleh")
s.checkInclusion("adc", "dcda")

/*:
 ## Sliding Window
 ### Time: O(N)
 ### Space: O(M)
 ![submission](2.png)
 */
class Solution2 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Length = s1.count
        let s2Length = s2.count
        guard s2Length >= s1Length else { return false }
        
        var s2 = Array(s2)
        var s1CharMap: [Character: Int] = [:]
        var start = 0, end = 0
        
        for c in s1 {
            s1CharMap[c, default: 0] += 1
        }
        
        while end < s2Length {
            let endChar = s2[end]
            let startChar = s2[start]
            
            if let e = s1CharMap[endChar], e > 0 {
                s1CharMap[endChar]! -= 1
                
                if (end - start + 1) == s1Length  {
                    return true
                }
                
                end += 1
            } else if s1CharMap[startChar] != nil {
                s1CharMap[startChar]! += 1
                start += 1
            } else {
                end += 1
                start = end
            }
        }
        
        return false
    }
}

let s2 = Solution2()

s2.checkInclusion("ab", "eidbaooo")
s2.checkInclusion("ab", "eidboaoo")
s2.checkInclusion("e", "eidboaoo")
s2.checkInclusion("bid", "eidboaoo")
s2.checkInclusion("hello", "ooolleoooleh")
s2.checkInclusion("adc", "dcda")

/*:
 ### Time: O(N*M)
 ### Space: O(1)
 ![submission](3.png)
 */

class Solution3 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Length = s1.count
        let s2Length = s2.count
        
        guard s2Length >= s1Length else { return false }
        
        var s2Arr = Array(s2)
        var s1CharTable: [Character: Int] = [:]
        
        for c in s1 {
            s1CharTable[c, default: 0] += 1
        }
        
        for start in 0...(s2Length - s1Length) {
            // Check Substring
            var i = start
            var end = start + s1Length - 1
            var s1CharTableCopy = s1CharTable
            
            while i <= end {
                if s1CharTableCopy[s2Arr[i]] != nil {
                    s1CharTableCopy[s2Arr[i]]! -= 1
                    if s1CharTableCopy[s2Arr[i]]! == 0 {
                        s1CharTableCopy.removeValue(forKey: s2Arr[i])
                    }
                } else {
                    break
                }
                if s1CharTableCopy.count == 0 {
                    return true
                }
                i += 1
            }
        }
        
        return false
    }
}

let s3 = Solution3()

s3.checkInclusion("ab", "eidbaooo")
s3.checkInclusion("ab", "eidboaoo")
s3.checkInclusion("e", "eidboaoo")
s3.checkInclusion("bid", "eidboaoo")
s3.checkInclusion("hello", "ooolleoooleh")
s3.checkInclusion("adc", "dcda")
s3.checkInclusion("adc", "dceadfebvddfdreeascda")
