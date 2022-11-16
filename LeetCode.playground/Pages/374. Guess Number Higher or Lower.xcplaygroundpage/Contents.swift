/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if num is higher than the picked number
 *                  1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

func guess(_ num: Int) -> Int { return 1 }

class GuessGame {}

/*:
 ### Binary Search
 ## Time: O(logN)
 ## Space: O(1)
 ![submission](1.png)
 */
class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var low = 1, high = n
        
        while low <= high {
            var mid = low + (high - low) / 2
            var guess = guess(mid)
            
            if guess == 0 { return mid }
            
            if guess == 1 {
                low = mid + 1
            } else if guess == -1 {
                high = mid - 1
            }
        }
        
        return 0
    }
}
