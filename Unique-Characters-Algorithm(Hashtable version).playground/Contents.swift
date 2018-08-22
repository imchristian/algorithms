// Given an string check if all the contained characters are unique
// Example: cat -> true
//          mom -> false

import Foundation

func isUniqueCharacters(word: String) -> Bool {
    var charsDict = [Character : Character]()
    
    for s in word {
        if (charsDict[s] != nil) {
            return false
        }
        charsDict[s] = s
    }
    
    return true
}

print(isUniqueCharacters(word: "cat"))
