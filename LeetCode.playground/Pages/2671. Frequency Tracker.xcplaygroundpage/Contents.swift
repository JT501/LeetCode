import Foundation

/*:
 ### Time: O(1)
 ### Space: O(n)
 ![submission](1.png)
 */
class FrequencyTracker {
    var values: [Int: Int]
    var frequencies: [Int: Int]

    init() {
        values = [:]
        frequencies = [:]
    }

    func add(_ number: Int) {
        frequencies[values[number, default: 0], default: 0] -= 1
        values[number, default: 0] += 1
        frequencies[values[number, default: 0], default: 0] += 1
    }

    func deleteOne(_ number: Int) {
        guard values[number, default: 0] > 0 else { return }
        frequencies[values[number, default: 0], default: 0] -= 1
        values[number, default: 0] -= 1
        frequencies[values[number, default: 0], default: 0] += 1
    }

    func hasFrequency(_ frequency: Int) -> Bool {
        frequencies[frequency, default: 0] > 0
    }
}

let f = FrequencyTracker()
f.deleteOne(5)
f.hasFrequency(1)
f.hasFrequency(1)
f.deleteOne(3)
f.hasFrequency(1)
f.hasFrequency(1)
f.add(7)
f.deleteOne(7)
f.deleteOne(7)
