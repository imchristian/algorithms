import Foundation

public class TrieNode<Key: Hashable> {
    public var key: Key?
    public var countOfWords: Int = 0
    public var children: [Key: TrieNode] = [:]
    
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
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element)
            }
            current = current.children[element]!
            
            current.countOfWords += 1
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

let trie = Trie<String>()

let n = Int(readLine()!)!
for _ in 1...n {
    let line = readLine()!.components(separatedBy: " ")
    if line[0] == "add" {
        trie.insert(line[1])
    } else {
        print(trie.collections(startingWith: line[1]))
    }
}

