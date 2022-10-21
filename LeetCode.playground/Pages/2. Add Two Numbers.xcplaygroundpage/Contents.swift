public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var _l1 = l1
        var _l2 = l2
        
        var result: ListNode? = nil
        var quotient: Int = 0
        
        func assignNext(_ l: ListNode, _ next: ListNode) -> ListNode {
            if (l.next != nil) {
                l.next = assignNext(l.next!, next)
            } else {
                l.next = next
            }
            return l
        }
        
        repeat {
            let value1 = _l1 != nil ? _l1!.val : 0
            let value2 = _l2 != nil ? _l2!.val : 0
            
            let newValue = value1 + value2 + quotient

            quotient = newValue / 10
            
            if (result == nil) {
                result = ListNode(newValue % 10)
            } else {
                result = assignNext(result!, ListNode(newValue % 10))
            }
            
            _l1 = _l1?.next
            _l2 = _l2?.next
            
        } while _l1 != nil || _l2 != nil || quotient != 0
        
        return result
    }
}

let s = Solution()

s.addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4))))
s.addTwoNumbers(ListNode(0), ListNode(0))
s.addTwoNumbers(ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9))))))), ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))
