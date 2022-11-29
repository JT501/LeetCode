/*:
 ## Hashtable
 ### Time: O(1)
 ### Space: O(N)
 ![submission](1.png)
 */
class RandomizedSet {
    
    internal var elements = [Int]()
    internal var hashmap = [Int: Int]()
    
    init() {}
    
    func insert(_ val: Int) -> Bool {
        guard hashmap[val] == nil else { return false }
        hashmap[val] = elements.count
        elements.append(val)
        
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = hashmap[val] else { return false }
        hashmap[elements.last!] = index
        elements.swapAt(index, elements.count - 1)
        elements.removeLast()
        hashmap.removeValue(forKey: val)
        
        return true
    }
    
    func getRandom() -> Int {
        elements[.random(in: 0..<elements.count)]
    }
}

let obj = RandomizedSet()
obj.remove(0)
obj.remove(0)
obj.insert(0)
obj.getRandom()
obj.remove(0)
obj.insert(0)
