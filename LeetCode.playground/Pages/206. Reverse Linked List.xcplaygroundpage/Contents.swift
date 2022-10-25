public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        func reverse(_ head: ListNode?, _ previous: ListNode?) -> ListNode? {
            if let head = head {
                var next = head.next
                head.next = previous
                
                return reverse(next, head)
            } else {
                return previous
            }
        }
        
        return reverse(head, nil)
    }
}

let s = Solution()

s.reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
