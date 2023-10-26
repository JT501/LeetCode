class Solution {
    class Pair {
        var x: Int
        var y: Int
        
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        var points = [Pair]()
        for point in trees {
            points.append(Pair(x: point[0], y: point[1]))
        }
        var res = [Pair]()
        if points.count == 1 {
            return trees
        }
        let n = points.count
        points.sort(by: { (a, b) -> Bool in
            a.y == b.y ? a.x < b.x : a.y < b.y
        })
        var dup = Set<[Int]>()
        var hull = [Pair]()
        
        hull.append(points[0])
        hull.append(points[1])
        
        for i in 2..<n {
            var top = hull.popLast()!
            while !hull.isEmpty && ccw(hull.last!, top, points[i]) < 0 {
                top = hull.popLast()!
            }
            hull.append(top)
            hull.append(points[i])
        }
        for i in (0..<n-1).reversed() {
            var top = hull.popLast()!
            while !hull.isEmpty && ccw(hull.last!, top, points[i]) < 0 {
                top = hull.popLast()!
            }
            hull.append(top)
            hull.append(points[i])
        }
        
        for p in hull {
            let tmp = [p.x, p.y]
            if dup.contains(tmp) {
                continue
            }
            dup.insert(tmp)
            res.append(p)
        }
        
        var ans = [[Int]](repeating: [Int](repeating: 0, count: 2), count: res.count)
        var i = 0
        for p in res {
            ans[i][0] = p.x
            ans[i][1] = p.y
            i += 1
        }
        
        return ans
        
    }
    
    func ccw(_ a: Pair, _ b: Pair, _ c: Pair) -> Int {
        let cp = (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)
        if cp < 0 {
            return -1
        } else if cp > 0 {
            return 1
        } else {
            return 0
        }
    }
}

let s = Solution().outerTrees

s([[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]])
