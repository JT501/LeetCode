/*:
 ## Depth First Search
 ### Time: O(N)
 ### Space: O(N)
 ![submission](1.png)
 */
class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {
        var n = parent.count
        var s = Array(s)
        var adj = [Int: [Int]]()
        var longestPath = 1
        
        guard n > 1 else { return n }
        
        for i in 1..<n {
            adj[parent[i], default: []].append(i)
        }
        
        func dfs(_ node: Int) -> Int {
            var longestChain = 0, secondLongestChain = 0
            
            for child in adj[node, default: []] {
                var longestChainFromChild = dfs(child)
                
                if s[node] == s[child] {
                    continue
                }
                
                if longestChainFromChild > longestChain {
                    secondLongestChain = longestChain
                    longestChain = longestChainFromChild
                } else if longestChainFromChild > secondLongestChain {
                    secondLongestChain = longestChainFromChild
                }
            }
            
            longestPath = max(longestPath, longestChain + secondLongestChain + 1)
            
            return longestChain + 1
        }
        
        dfs(0)
        
        return longestPath
    }
}

let s = Solution().longestPath

s([-1,0,0,1,1,2], "abacbe")
s([-1,0,0,0], "aabc")
