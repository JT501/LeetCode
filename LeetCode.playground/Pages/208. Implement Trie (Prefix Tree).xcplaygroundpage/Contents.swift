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

let obj = Trie()
obj.insert("word")
obj.search("word")
obj.startsWith("wo")
