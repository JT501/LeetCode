public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*:
 ## Fast Slow Pointers
 ### Time: O(n)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func reorderList(_ head: ListNode?) {
        if head?.next == nil { return }

        // Find mid point
        var mid = head, fast = head

        while fast?.next != nil {
            mid = mid?.next
            fast = fast?.next?.next
        }

        // Reverse second half list
        var first = head, second = reverse(node: mid)

        // Merge the lists
        while first != nil {
            var next = first?.next
            first?.next = second
            first = next

            next = second?.next
            second?.next = first
            second = next
        }
    }

    func reverse(node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = node

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
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
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
