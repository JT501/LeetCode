public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*:
 ## Fast Slow Pointers
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode()
        dummy.next = head

        var fast = head, slow: ListNode? = dummy
        var k = 0

        while fast != nil {
            fast = fast?.next
            if k >= n {
                slow = slow?.next
            }
            k += 1
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
