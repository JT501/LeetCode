public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

/*:
 ### Time: O(n)
 ### Space: O(n)
 ![submission](1.png)
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else { return head }

        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil

        return p
    }
}

let s = Solution()

s.reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))

/*:
 ### Time: O(n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        func reverse(head: ListNode?, prev: ListNode?) -> ListNode? {
            guard let head else { return prev }

            let next = head.next
            head.next = prev

            return reverse(head: next, prev: head)
        }

        return reverse(head: head, prev: nil)
    }
}

/*:
 ### Time: O(n)
 ### Space: O(1)
 ![submission](3.png)
 */
class Solution3 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var current = head

        while current != nil {
            let next: ListNode? = current!.next
            current!.next = prev
            prev = current
            current = next
        }

        return prev
    }
}

/*:
 ### Time: O(n)
 ### Space: O(n)
 ![submission](4.png)
 */
class Solution4 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var values = [Int]()
        var node = head

        while node != nil {
            values.append(node!.val)
            node = node!.next
        }

        node = head
        while node != nil {
            node!.val = values.removeLast()
            node = node!.next
        }

        return head
    }
}
