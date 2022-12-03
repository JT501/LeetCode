/*:
 ## Hashtable + Bucket Sort
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func frequencySort(_ s: String) -> String {
        var hashmap = [Character: Int]()
        
        for char in s {
            hashmap[char, default: 0] += 1
        }
        
        var bucket = Array(repeating: [Character](), count: (hashmap.values.max() ?? 0) + 1)
        
        for (k, v) in hashmap {
            bucket[v].append(k)
        }
        
        var ans = [Character]()
        
        for i in (1..<bucket.count).reversed() {
            for char in bucket[i] {
                ans.append(contentsOf: Array(repeating: char, count: i))
            }
        }
        
        return String(ans)
    }
}

let s = Solution().frequencySort

s("tree")
s("cccaaa")
s("Aabb")

/*:
 ## Hashtable
 ### Time: O(N*log N)
 ### Space: O(N)
 ![submission](2.png)
 */
class Solution2 {
    func frequencySort(_ s: String) -> String {
        var hashmap = [Character: Int]()
        
        for char in s {
            hashmap[char, default: 0] += 1
        }
        
        let sorted = hashmap.sorted(by: { $0.value > $1.value })
        
        var ans = [Character]()
        
        for (k, v) in sorted {
            ans.append(contentsOf: Array(Array(repeating: k, count: v)))
        }
        
        return String(ans)
    }
}

let s2 = Solution2().frequencySort

s2("tree")
s2("cccaaa")
s2("Aabb")


