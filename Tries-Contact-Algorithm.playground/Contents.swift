import Foundation

public class TrieNode<Key: Hashable> {
    public var key: Key?
    public var countOfWords: Int = 0
    public var children: [Key: TrieNode] = [:]
    public var isTerminating = false
    
    public init(key: Key?) {
        self.key = key
    }
}

public class Trie<CollectionType: Collection>
where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil)
    
    // Insert Function
    public func insert(_ collection: CollectionType) {
        var current = root
        for i in 0..<collection.count {
            let index = collection.index(collection.startIndex, offsetBy: i)
            let element = collection[index]
            if current.children[element] == nil {
                current.children[element] = Node(key: element)
            }
            current = current.children[element]!
            
            current.countOfWords += 1
            
            current.isTerminating = true
        }
    }
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    func collections(startingWith prefix: CollectionType) -> Int {
        var current = root
        for element in prefix {
            guard let child = current.children[element] else {return 0}
            current = child
        }
        
        return current.countOfWords
    }
}


guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }


let trie = Trie<String>()

for _ in 1...n {
    guard let opContactTemp = readLine() else { fatalError("Bad input") }
    let opContact = opContactTemp.split(separator: " ").map{ String($0) }
    
    let op = opContact[0]
    
    let contact = opContact[1]
    
    if (op == "add") {
        trie.insert(contact)
    } else {
        print(trie.collections(startingWith: contact))
    }
}

