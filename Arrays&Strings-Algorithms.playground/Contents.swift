// Exercises from Arrays and Strings chapter

import Foundation

// Given two string, write a method to decide if one is a permutation
// of the other
func isPermutation(strA: String, strB: String) -> Bool {
    if (strA.sorted() == strB.sorted()) {
        return true
    }
    
    return false
}

isPermutation(strA: "abcd", strB: "dcba")


// Write a method to replace all spaces in a string with '%20'
func urlify(url : String) -> String {
    let urlify = url.replacingOccurrences(of: " ", with: "%20")
    
    return urlify
}

urlify(url: "hello world")
