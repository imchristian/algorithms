/*
 Given a string, find the first non-repeating character in it and return it's index.
 if It doesn't exist, return -1
 
 Example:
 Input: s = "leetcode"
 Output = 0
 */

import Foundation

func firstUniqChar(_ s: String) -> Int {
    var dictOfOccurrences = [Character : Int]()
    var count = 0
    
    for char in s {
        if dictOfOccurrences[char] != nil {
            dictOfOccurrences[char] = dictOfOccurrences[char]! + 1
        } else {
            dictOfOccurrences[char] = 1
        }
    }
    
    for char in s {
        if dictOfOccurrences[char] == 1 {
            return count
        }
        count += 1
    }
    return -1
}
