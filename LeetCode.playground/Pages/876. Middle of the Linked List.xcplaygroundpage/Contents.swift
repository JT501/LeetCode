public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
/*:
 ## Fast Slow Pointer
 */
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow
    }
}

let s = Solution()

s.middleNode(nil)
s.middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
s.middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))

/*:
 ## Brute Force
 */

class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var head = head
        var current: ListNode? = head
        var arr = [ListNode]()
        
        while current != nil {
            arr.append(current!)
            current = current?.next
        }
        
        return arr.count > 1 ? arr[arr.count / 2] : head
    }
}

let s2 = Solution2()

s2.middleNode(nil)
s2.middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
s2.middleNode(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))
