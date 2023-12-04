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
 ### Time: O(n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let head = head else { return false }
        var fast = head, slow = head

        while fast.next?.next != nil {
            slow = slow.next!
            fast = fast.next!.next!

            if slow === fast { return true }
        }

        return false
    }
}
/*:
 ## Hashtable
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
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
            if !visited.insert(head!).inserted {
                return true
            }
            
            head = head!.next
        }
        
        return false
    }
}
