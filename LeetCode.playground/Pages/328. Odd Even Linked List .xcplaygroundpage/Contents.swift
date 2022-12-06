/*:
 ### Time: O(N)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var odd = head, even = head?.next, evenHead = even
        
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        
        odd?.next = evenHead
        
        return head
    }
}

let s = Solution().oddEvenList

s(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
s(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))
s(ListNode())

/*:
 ### Time: O(N)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var cur = head
        var prev = cur
        var curEven: ListNode? = nil
        var dummyEven = ListNode(0)
        var count = 1
        
        while cur != nil {
            // If even index
            if count % 2 == 0 {
                let next = cur?.next
                
                if curEven == nil {
                    curEven = cur
                    curEven?.next = nil
                    dummyEven.next = curEven
                } else {
                    curEven?.next = cur
                    cur?.next = nil
                    curEven = cur
                }
                
                prev?.next = next
                cur = prev
            }
            
            prev = cur
            cur = cur?.next
            count += 1
        }
        
        prev?.next = dummyEven.next
        
        return head
    }
}

let s2 = Solution2().oddEvenList

s2(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
s2(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))
s2(ListNode())

