/*:
 ## Depth First Search + Trie Data Structure
 */
class Solution {
    class TrieNode {
        var links = [Character: TrieNode]()
        var isEnd = false
        var word = ""
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var board = board
        let m = board.count, n = board[0].count
        let trie = TrieNode()
        var ans = Set<String>()
        
        for word in words {
            var cur = trie
            for c in word {
                if cur.links[c] == nil {
                    cur.links[c] = TrieNode()
                }
                cur = cur.links[c]!
            }
            cur.isEnd = true
            cur.word = word
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if (ans.count == words.count) { return Array(ans) }
                dfs(&board, trie, i, j, &ans)
            }
        }
        
        return Array(ans)
    }
    
    func dfs(_ board: inout [[Character]], _ node: TrieNode, _ i: Int, _ j: Int, _ ans: inout Set<String>) {
        guard let nextNode = node.links[board[i][j]] else { return }
        guard board[i][j] != "#" else { return }
        
        if !nextNode.word.isEmpty {
            ans.insert(nextNode.word)
            nextNode.word = ""
        }
        
        let char = board[i][j]
        board[i][j] = "#"
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        for direction in directions {
            let x = i + direction.0
            let y = j + direction.1
            
            guard x >= 0 && y >= 0 && x < board.count && y < board[0].count else {
                continue
            }
            
            dfs(&board, nextNode, x, y, &ans)
        }
        
        board[i][j] = char
    }
}

let s = Solution()

//s.findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain","oataa"])
//s.findWords([["a","b"],["c","d"]], ["abcb"])
//s.findWords([["o","a","b","n"],["o","t","a","e"],["a","h","k","r"],["a","f","l","v"]], ["oa","oaa"])
//s.findWords([["a","a"],["a","a"]], ["aaaaa"])
//s.findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain","hklf", "hf"])
//s.findWords([["o","a","b","n"],["o","t","a","e"],["a","h","k","r"],["a","f","l","v"]], ["oa","oaa"])
//s.findWords([["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"]],["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
//s.findWords([["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"]], ["lllllll","fffffff","ssss","s","rr","xxxx","ttt","eee","ppppppp","iiiiiiiii","xxxxxxxxxx","pppppp","xxxxxx","yy","jj","ccc","zzz","ffffffff","r","mmmmmmmmm","tttttttt","mm","ttttt","qqqqqqqqqq","z","aaaaaaaa","nnnnnnnnn","v","g","ddddddd","eeeeeeeee","aaaaaaa","ee","n","kkkkkkkkk","ff","qq","vvvvv","kkkk","e","nnn","ooo","kkkkk","o","ooooooo","jjj","lll","ssssssss","mmmm","qqqqq","gggggg","rrrrrrrrrr","iiii","bbbbbbbbb","aaaaaa","hhhh","qqq","zzzzzzzzz","xxxxxxxxx","ww","iiiiiii","pp","vvvvvvvvvv","eeeee","nnnnnnn","nnnnnn","nn","nnnnnnnn","wwwwwwww","vvvvvvvv","fffffffff","aaa","p","ddd","ppppppppp","fffff","aaaaaaaaa","oooooooo","jjjj","xxx","zz","hhhhh","uuuuu","f","ddddddddd","zzzzzz","cccccc","kkkkkk","bbbbbbbb","hhhhhhhhhh","uuuuuuu","cccccccccc","jjjjj","gg","ppp","ccccccccc","rrrrrr","c","cccccccc","yyyyy","uuuu","jjjjjjjj","bb","hhh","l","u","yyyyyy","vvv","mmm","ffffff","eeeeeee","qqqqqqq","zzzzzzzzzz","ggg","zzzzzzz","dddddddddd","jjjjjjj","bbbbb","ttttttt","dddddddd","wwwwwww","vvvvvv","iii","ttttttttt","ggggggg","xx","oooooo","cc","rrrr","qqqq","sssssss","oooo","lllllllll","ii","tttttttttt","uuuuuu","kkkkkkkk","wwwwwwwwww","pppppppppp","uuuuuuuu","yyyyyyy","cccc","ggggg","ddddd","llllllllll","tttt","pppppppp","rrrrrrr","nnnn","x","yyy","iiiiiiiiii","iiiiii","llll","nnnnnnnnnn","aaaaaaaaaa","eeeeeeeeee","m","uuu","rrrrrrrr","h","b","vvvvvvv","ll","vv","mmmmmmm","zzzzz","uu","ccccccc","xxxxxxx","ss","eeeeeeee","llllllll","eeee","y","ppppp","qqqqqq","mmmmmm","gggg","yyyyyyyyy","jjjjjj","rrrrr","a","bbbb","ssssss","sss","ooooo","ffffffffff","kkk","xxxxxxxx","wwwwwwwww","w","iiiiiiii","ffff","dddddd","bbbbbb","uuuuuuuuu","kkkkkkk","gggggggggg","qqqqqqqq","vvvvvvvvv","bbbbbbbbbb","nnnnn","tt","wwww","iiiii","hhhhhhh","zzzzzzzz","ssssssssss","j","fff","bbbbbbb","aaaa","mmmmmmmmmm","jjjjjjjjjj","sssss","yyyyyyyy","hh","q","rrrrrrrrr","mmmmmmmm","wwwww","www","rrr","lllll","uuuuuuuuuu","oo","jjjjjjjjj","dddd","pppp","hhhhhhhhh","kk","gggggggg","xxxxx","vvvv","d","qqqqqqqqq","dd","ggggggggg","t","yyyy","bbb","yyyyyyyyyy","tttttt","ccccc","aa","eeeeee","llllll","kkkkkkkkkk","sssssssss","i","hhhhhh","oooooooooo","wwwwww","ooooooooo","zzzz","k","hhhhhhhh","aaaaa","mmmmm"])


/*:
 ## Breadth First Search - TLE :(
 */
class Solution2 {
    class TrieNode {
        var links = [Character: TrieNode]()
        var isEnd = false
    }

    class Trie {
        private let root: TrieNode

        init() {
            root = TrieNode()
        }
        
        func insert(_ word: String) {
            var node = root
            for c in word {
                if node.links[c] == nil {
                    node.links[c] = TrieNode()
                }
                node = node.links[c]!
            }
            node.isEnd = true
        }
        
        func search(_ word: String) -> Bool {
            var node = root
            
            for c in word {
                if let charNode = node.links[c] {
                    node = charNode
                } else {
                    return false
                }
            }
            return node.isEnd
        }
        
        func startsWith(_ prefix: String) -> Bool {
            var node = root
            
            for c in prefix {
                if let charNode = node.links[c] {
                    node = charNode
                } else {
                    return false
                }
            }
            return true
        }
    }
    
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let m = board.count, n = board[0].count
        var words = Set(words)
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        let trie = Trie()
        var ans = Set<String>()
        
        words.forEach { word in
            trie.insert(word)
        }
        
        for i in 0..<m {
            for j in 0..<n {
                let startingChar = board[i][j]
                guard trie.startsWith(String(startingChar)) else {
                    continue
                }
                
                var queue = [(Int, Int, [Character], [(Int, Int)])]()
                
                queue.append((i, j, [], [(i, j)]))
                
                while !queue.isEmpty {
                    
                    for _ in 0..<queue.count {
                        let cur = queue.removeFirst()
                        var curWord = cur.2
                        var curVisited = cur.3
                        curWord.append(board[cur.0][cur.1])
                        
                        if words.contains(String(curWord)) {
                            ans.insert(String(curWord))
                            if ans.count == words.count {
                                return Array(ans)
                            }
                        }
                        
                        for direction in directions {
                            let x = cur.0 + direction.0
                            let y = cur.1 + direction.1
                            
                            guard x >= 0 && y >= 0 && x < m && y < n else {
                                continue
                            }
                            
                            let newChar = board[x][y]
                            let newWord = String(curWord) + String(newChar)
                            
                            if trie.startsWith(newWord) && !curVisited.contains(where: {$0 == (x, y)}) {
                                curVisited.append((x, y))
                                queue.append((x, y, curWord, curVisited))
                                curVisited.removeLast()
                            }
                        }
                    }
                }
            }
        }
        
        return Array(ans)
    }
}

let s2 = Solution2()

s2.findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain","oataa"])
s2.findWords([["a","b"],["c","d"]], ["abcb"])
s2.findWords([["o","a","b","n"],["o","t","a","e"],["a","h","k","r"],["a","f","l","v"]], ["oa","oaa"])
s2.findWords([["a","a"],["a","a"]], ["aaaaa"])
s2.findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain","hklf", "hf"])
s2.findWords([["o","a","b","n"],["o","t","a","e"],["a","h","k","r"],["a","f","l","v"]], ["oa","oaa"])
//s2.findWords([["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a"]],["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
