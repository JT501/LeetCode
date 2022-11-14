public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*:
 ### Time: O(n²)
 ### Space: O(n)
 */
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var head = head
        let dummy = ListNode(Int.min, head)
        
        while head != nil && head!.next != nil {
            var next = head!.next!
            
            if head!.val <= next.val {
                head = next
            } else {
                var previous = dummy
                
                while previous.next != nil && previous.next!.val < next.val {
                    previous = previous.next!
                }
                head!.next = next.next
                next.next = previous.next
                previous.next = next
            }
            
        }
        
        return dummy.next
    }
}

let s = Solution()

s.insertionSortList(ListNode(4, ListNode(2, ListNode(1, ListNode(3)))))
s.insertionSortList(ListNode(-1, ListNode(5, ListNode(3, ListNode(4, ListNode(0))))))
