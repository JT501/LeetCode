/*:
 ## Monotonic Stack (Decreasing)
 */
class StockSpanner {
    var prices: [Int]
    var stack: [Int]

    init() {
        prices = []
        stack = []
    }
    
    func next(_ price: Int) -> Int {
        prices.append(price)
        
        while stack.count > 0 && price >= prices[stack.last!] {
            stack.removeLast()
        }
        stack.append(prices.count - 1)
        
        if stack.count < 2 {
            return prices.count
        } else {
            return stack.last! - stack[stack.count - 2]
        }
    }
}

let obj = StockSpanner()

obj.next(100)
obj.next(80)
obj.next(60)
obj.next(70)
obj.next(60)
obj.next(75)
obj.next(85)
obj.next(105)
obj.next(90)
