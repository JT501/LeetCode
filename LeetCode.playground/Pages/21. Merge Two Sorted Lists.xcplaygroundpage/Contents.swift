public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

/*:
 ## Recursion
 ### Time: O(n+m)
 ### Space: O(n+m)
 ![submission](1.png)
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }

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
 ## Iteration
 ### Time: O(n+m)
 ### Space: O(1)
 ![submission](2.png)
 */
class Solution2 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1, list2 = list2

        let dummy = ListNode()
        var curr = dummy

        while list1 != nil || list2 != nil {
            if list1 == nil {
                curr.next = list2
                break
            } else if list2 == nil {
                curr.next = list1
                break
            } else if list1!.val < list2!.val {
                curr.next = list1
                list1 = list1?.next
            } else {
                curr.next = list2
                list2 = list2?.next
            }
            curr = curr.next!
        }

        return dummy.next
    }
}

let s2 = Solution2()

s2.mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4))))
