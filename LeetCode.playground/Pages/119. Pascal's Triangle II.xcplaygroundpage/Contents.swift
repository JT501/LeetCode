class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = Array(repeating: 0, count: rowIndex + 1)
        row[0] = 1
        
        guard rowIndex >= 1 else { return row }
        
        for i in 1...rowIndex {
            for j in (1...i).reversed() {
                row[j] = row[j - 1] + row[j]
            }
        }
        
        return row
    }
}

let s = Solution()

s.getRow(0)
s.getRow(33)



class Solution2 {
    func getRow(_ rowIndex: Int) -> [Int] {
        var dp: [String: Int] = [:]
        
        func getNum(row: Int, column: Int) -> Int {
            print(dp)
            if (row == column) || column == 0 {
                return 1
            } else if let val = dp["\(row):\(column)"] {
                return val
            } else {
                let val = getNum(row: row - 1, column: column - 1) + getNum(row: row - 1, column: column)
                dp["\(row):\(column)"] = val
                return val
            }
        }
        
        var res: [Int] = []
        
        for i in 0...rowIndex {
            res.append(getNum(row: rowIndex, column: i))
        }
        
        return res
    }
}

let s = Solution2()

s2.getRow(0)
s2.getRow(5)
