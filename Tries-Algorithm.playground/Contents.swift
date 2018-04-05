// Tries Algorithm Example

import Foundation


//basic trie data structure
public class TrieNode {
    var key: String?
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
    
    private var root = TrieNode()
    
    //builds a tree hierarchy of dictionary content
    func append(word keyword: String) {
        //trivial case
        guard keyword.length > 0 else {
            return
        }
        
        var current: TrieNode = root
        
        while keyword.length != current.level {
            var childToUse: TrieNode!
            let searchKey = keyword.substring(to: current.level + 1)
            
            //iterate through child nodes
            for child in current.children {
                if child.key == searchKey {
                    childToUse = child
                    break
                }
            }
            
            //new node
            if childToUse == nil {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            current = childToUse
        }
        
        //final end of word check
        if keyword.length == current.level {
            current.isFinal = true
            print("end of word reached!")
            return
        }
    }
    
    //find words based on the prefix
    func find(_ keyword: String) -> Array<String>? {
        //trivial case
        guard keyword.length > 0 else {
            return nil
        }
        
        var current: TrieNode = root
        var wordList = Array<String>()
        
        while keyword.length != current.level {
            var childToUse: TrieNode!
            let searchKey = keyword.substring(to: current.level + 1)
            
            //iterate trough any child nodes
            for child in current.children {
                if (child.key == searchKey) {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            if childToUse == nil {
                return nil
            }
        }
        
        //retrieve the keyword and any descendants
        if ((current.key == keyword) && (current.isFinal)) {
            if let key = current.key {
                wordList.append(key)
            }
        }
        
        //include only children that are words
        for child in current.children {
            if (child.isFinal == true) {
                if let key = child.key {
                    wordList.append(key)
                }
            }
        }
        
        return wordList
    }
}

extension String {
    //compute the length
    var length: Int {
        return self.count
    }
    
    //returns characters up to a specified integer
    func substring(to: Int) -> String {
        //define the range
        let range = self.index(self.startIndex, offsetBy: to)
        return String(self[..<range])
    }
}










