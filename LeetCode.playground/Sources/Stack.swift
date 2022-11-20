import Foundation

public struct Stack<T> {
    var array = [T]()
    
    public var isEmpty: Bool { array.isEmpty }
    public var count: Int { array.count }
    
    public mutating func push(_ element: T) { array.append(element) }
    
    public mutating func pop() -> T? { array.popLast() }
    
    public var top: T? { array.last }
    
    public init(_ array: [T] = []) {
        self.array = array
    }
}
