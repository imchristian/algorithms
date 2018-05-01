// Hash Table Example

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private(set) public var count = 0
    public var isEmpty: Bool { return count == 0 }
    
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    // Function to determine the array index for a given key
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    // This function look up into the hash table to return an element value
    // First calculate the index for the given key, that give us an array index
    // maybe with another array inside of it because we can face some collision on
    // that index.
    // So we iterate through the sub array and search for the given key
    public func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil //key not in hash table
    }
    
    // This function update a value inside the hash table.
    // This we retreive the index for the given key
    // The first we iterate through the sub array to see if we don't already have
    // that key, if does we update the value.
    // If we don't have that key in the sub array, we add it to the chain at the end
    // And increase the count.
    public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        //Do we already have this key in the bucket?
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // This key isn't in the bucket yet; add it to the chain.
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    
    // This function try to remove some element in the hash table given a certain key
    // First retreive the index from the key.hashValue
    // Then we iterate through the sub array and check if the key match
    // if so, we delete the element, if not, we return nil because we don't find it
    public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        
        return nil // key not in the hash table
    }
    
}

// Create a new hash table
var hashTable = HashTable<String, String>(capacity: 5)
