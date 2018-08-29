/*
 Given two string s and t, write a function to determine if t is an anagram of s
 
 Example:
 Input: s="anagram", t="nagaram"
 */

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    
    var strDict = [Character : Int]()
    for char in s {
        if (strDict[char] != nil) {
            strDict[char] = strDict[char]! + 1
        } else {
            strDict[char] = 1
        }
    }
    
    for char in t {
        if strDict[char] == nil {
            return false
        } else {
            strDict[char] = strDict[char]! - 1
            if (strDict[char]! < 0) {
                return false
            }
        }
    }
    
    return true
}
