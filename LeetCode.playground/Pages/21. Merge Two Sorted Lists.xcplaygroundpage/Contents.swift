public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*:
 ### Time: O(N+M)
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.val <= list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
    }
}

let s = Solution()

s.mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4))))


/*:
 ### Time: O(N+M)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        func merge(_ list1: ListNode?, _ list2: ListNode?, _ previous: ListNode, _ head: ListNode) -> ListNode? {
            if list1 == nil && list2 == nil {
                return head.next
            } else if list1 == nil && list2 != nil {
                previous.next = list2
                return head.next
            } else if list2 == nil && list1 != nil {
                previous.next = list1
                return head.next
            }
            
            if list1!.val <= list2!.val {
                var next = list1!.next
                previous.next = ListNode(list1!.val)
                return merge(next, list2, previous.next!, head)

            } else {
                var next = list2!.next
                previous.next = ListNode(list2!.val)
                return merge(list1, next, previous.next!, head)
            }
        }
        
        var head = ListNode()
        return merge(list1, list2, head, head)
    }
}

let s2 = Solution2()

s2.mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4))))
