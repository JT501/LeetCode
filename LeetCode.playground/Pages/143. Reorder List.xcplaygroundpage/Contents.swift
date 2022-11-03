public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*:
 ## Fast Slow Pointers
 */
class Solution {
    func reorderList(_ head: ListNode?) {
        var fast = head, slow = head
        
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
    
        var first = head, second = reverse(slow)
        
        while second?.next != nil {
            var tmp = first?.next
            first!.next = second
            first = tmp
            
            tmp = second?.next
            second?.next = first
            second = tmp
        }
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head
        
        while curr != nil {
            let next = curr?.next
            
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        return prev
    }
}

/*:
 ## Two Pointers
 */
class Solution2 {
    func reorderList(_ head: ListNode?) {
        var current = head
        var nodes = [ListNode]()
        
        while current != nil {
            nodes.append(current!)
            current = current!.next
        }
        
        var start = 0
        var end = nodes.count - 1
        
        while start + 1 < end {
            nodes[start].next = nodes[end]
            nodes[end].next = nodes[start + 1]
            
            start += 1
            end -= 1
        }
        
        nodes[end].next = nil
    }
}

let s2 = Solution2()

s2.reorderList(ListNode(1, ListNode(2, ListNode(3, ListNode(4)))))
