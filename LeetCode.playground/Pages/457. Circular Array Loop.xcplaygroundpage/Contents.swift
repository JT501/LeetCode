/*:
 ## Fast Slow Pointers
 */
class Solution {
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        for (i, num) in nums.enumerated() {
            var slow = i
            var fast = i
            
            repeat {
                slow = findIndex(nums, num, slow)
                fast = findIndex(nums, num, fast)
                if fast != -1 {
                    fast = findIndex(nums, num, fast)
                }
                if slow == fast && slow != -1 {
                    return true
                }

            } while slow != -1 && fast != -1 && slow != fast
        }
        
        return false
    }
    
    private func findIndex(_ nums: [Int], _ num: Int, _ current: Int) -> Int {
        // if not same direction
        if (nums[current] > 0 && num < 0) || (nums[current] < 0 && num > 0) {
            return -1
        }
        
        let nextIndex = (current + abs(nums[current] + nums.count)) % nums.count
        
        // one element cycle
        if nextIndex == current {
            return -1
        }
        
        return nextIndex
    }
}

let s = Solution()

s.circularArrayLoop([2,-1,1,2,2])
s.circularArrayLoop([-1,-2,-3,-4,-5,6])
s.circularArrayLoop([1,-1,5,1,4])
s.circularArrayLoop([1,1])
s.circularArrayLoop([-2,-3,-9])
s.circularArrayLoop([-2,1,-1,-2,-2])
s.circularArrayLoop([2,2,2,2,2,4,7])


/*:
 ## Hashmap
 */
class Solution2 {
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        var hashmap = [Int: Int]()
        var cycle = [Int]()
        
        for (i, num) in nums.enumerated() {
            hashmap[i] = (i + abs(num + nums.count)) % nums.count
        }
        
        for i in 0..<nums.count {
            var j = i
            cycle = [i]
            for _ in 0..<nums.count {
                j = hashmap[j]!
                
                guard (nums[i] > 0 && nums[j] > 0) || (nums[i] < 0 && nums[j] < 0) else { break }
                
                cycle.append(j)
                
                if cycle.first == cycle.last {
                    if cycle.count - 1 > 1 {
                        return true
                    } else {
                        break
                    }
                }
            }
        }
        
        return false
    }
}

let s2 = Solution2()

s2.circularArrayLoop([2,-1,1,2,2])
s2.circularArrayLoop([-1,-2,-3,-4,-5,6])
s2.circularArrayLoop([1,-1,5,1,4])
s2.circularArrayLoop([1,1])
s2.circularArrayLoop([-2,-3,-9])
