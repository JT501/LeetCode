/*:
 ## Fast Slow Pointers
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        
        var slow: ListNode? = nil
        var fast = head
        var i = 0
        
        while fast != nil {
            if i == n - 1 {
                slow = dummy
            } else if i > n - 1 {
                slow = slow?.next
            }
            fast = fast?.next
            i += 1
        }
        
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
}

let s = Solution()

s.removeNthFromEnd(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))), 2)
s.removeNthFromEnd(ListNode(1), 1)
s.removeNthFromEnd(ListNode(1, ListNode(2)), 1)
s.removeNthFromEnd(ListNode(1, ListNode(2)), 2)