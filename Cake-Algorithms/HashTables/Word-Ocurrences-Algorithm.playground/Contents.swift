/*
 You want to build a word cloud, an infographic where the size of a word corresponds
 to how often it appears in the body of text.
 
 Write code that takes a long string and builds its word cloud data in a dictionary,
 where the keys are words and the values are the number of times the words occurred.
 */

import Foundation

func countWords(in string: String) -> [String : Int] {
    var countWordsDict = [String : Int]()
    let splitted = string.characters.split { [",", ", ", ":", ".", " "].contains(String($0)) }
    let wordList = splitted.map { String($0).trimmingCharacters(in: .whitespaces) }
    
    for s in wordList {
        let word = s.lowercased()
        if countWordsDict[word] != nil {
            countWordsDict[word]! += 1
        } else {
            countWordsDict[word] = 1
        }
    }
    print(countWordsDict)
    return countWordsDict
}

countWords(in: "After beating the eggs, Dana read the next step: Add milk and eggs, then add flour and sugar.")
