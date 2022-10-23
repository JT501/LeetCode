class VersionControl {
    private let firstBad: Int
    
    func isBadVersion(_ version: Int) -> Bool {
        return version >= firstBad
    }
    
    init(_ firstBad: Int) {
        self.firstBad = firstBad
    }
}

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var start = 1, end = n
        
        while start < end {
            let mid = start + (end - start) / 2
            
            if !isBadVersion(mid) {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        return start
    }
}

Solution(1).firstBadVersion(1)
Solution(4).firstBadVersion(5)
Solution(1).firstBadVersion(3)
