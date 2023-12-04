/*:
 ## Divide and Conquer
 ### Time: O(n*㏒k) where k is the length of lists
 ### Space: O(1)
 ![submission](1.png)
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let length = lists.count

        if length == 0 { return nil }
        if length == 1 { return lists.first! }

        // Divide
        let mid = lists.count / 2
        let left = Array(lists[..<mid])
        let right = Array(lists[mid...])

        let leftSorted = mergeKLists(left)
        let rightSorted = mergeKLists(right)

        // Conquer
        return merge(a: leftSorted, b: rightSorted)
    }

    func merge(a: ListNode?, b: ListNode?) -> ListNode? {
        guard let a = a else { return b }
        guard let b = b else { return a }

        if a.val < b.val {
            a.next = merge(a: a.next, b: b)
            return a
        } else {
            b.next = merge(a: a, b: b.next)
            return b
        }
    }
}

/*:
 ## Brute Force
 ### Time: O(n㏒n)
 ### Space: O(n)
 ![submission](2.png)
 */
class Solution2 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var values = [Int]()

        for list in lists.compactMap({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                values.append(head!.val)
                head = head?.next
            }
        }

        if values.isEmpty { return nil }

        values.sort()

        let head = ListNode()
        var curr = head

        for value in values {
            curr.next = ListNode(value)
            curr = curr.next!
        }

        return head.next
    }
}
