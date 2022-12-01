public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

/*:
 ### Time: O(N)
 ### Space: O(N / 2)
 ![submission](1.png)
 */
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dummy = ListNode(101, head)
        var cur = head
        var prev = dummy
        
        while cur != nil {
            if cur!.next?.val == cur!.val {
                while cur!.next?.val == cur!.val {
                    cur = cur!.next
                }
                let next = cur!.next
                cur = prev
                cur!.next = next
            }
            
            prev = cur!
            cur = cur!.next
        }
        
        return dummy.next
    }
}

let s = Solution().deleteDuplicates

s(ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(4, ListNode(4, ListNode(5))))))))
s(ListNode(1, ListNode(1, ListNode(1, ListNode(2, ListNode(3))))))
s(ListNode(1, ListNode(1, ListNode(1))))
