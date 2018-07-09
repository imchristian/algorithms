// Stacks Data Structure - Ray Wenderlich
public struct Stack<Element> {
    private var storage: [Element] = []
    public init() {}
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
}


