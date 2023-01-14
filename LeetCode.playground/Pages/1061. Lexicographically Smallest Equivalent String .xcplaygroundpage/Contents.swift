/*:
 ## Union Find
 ### Time: O((N+M) * ㏒∣Σ∣)
 ### Space: O(∣Σ∣)
 ![submission](1.png)
 */

class Solution {

    var parent: [Character: Character] = [:]
    
    func smallestEquivalentString(_ s1: String,_ s2: String,_ baseStr: String) -> String {
        var chars = "qwertyuiopasdfghjklzxcvbnm"

        for c in chars {
            parent[c] = c
        }
        var str1 = Array(s1)
        var str2 = Array(s2)
        for i in stride(from: 0, to: s1.count, by: 1) {
            union(str1[i], str2[i])
        }
        let result = Array(baseStr)
                        .map{ find($0) }
                        .reduce(""){x, y in String(x) + String(y)}
        return result
    }

    private func find(_ char: Character) -> Character {
        if parent[char]! == char {
            return char
        }
        parent[char] = find(parent[char]!)

        return parent[char]!
    }

    func union(_ char1: Character,_ char2: Character) {
        var c1 = find(char1)
        var c2 = find(char2)
        if c1 < c2 {
            parent[c2] = c1
        } else {
            parent[c1] = c2
        }
    }

}
