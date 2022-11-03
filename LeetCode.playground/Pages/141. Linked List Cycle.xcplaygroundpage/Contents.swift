public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/*:
 ## Fast Slow Pointers
 */
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head, slow = head
        
        while fast?.next != nil{
            if fast === slow {
                return true
            }
            
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return false
    }
}

/*:
 ## Brute Force
 */
extension ListNode: Hashable {
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
}

class Solution2 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var head = head
        var visited = Set<ListNode>()
        
        while head != nil {
            if visited.contains(head!) {
                return true
            }
            
            visited.insert(head!)
            
            head = head!.next
        }
        
        return false
    }
}
