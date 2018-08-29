/*
 Write a function to find the longest commons prefix string amongst an
 array of strings.
 
 If there is no common prefix, return an empty string ""
 
 Example:
 Input: ["flower", "flow", "flight"]
 Output: "fl"
 */

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    // if the array is empty we return empty
    guard strs.count > 0 else {
        return ""
    }
    
    // We store the shortest word to use word to use as the
    // first try of common prefix
    let shortestWord = strs.min { $0.count < $1.count }!
    var longestPrefix = shortestWord
    
    // Iterate trough all the words
    for str in strs {
        // While the current string doesn't have the prefix or
        // the prefix is not empty
        while !str.hasPrefix(longestPrefix), longestPrefix.count > 0 {
            // We keep removing the last char inside the shortest word
            // until either we match as a prefix of the current word
            // or the shortestWord is empty
            longestPrefix.removeLast()
        }
    }
    
    // If we delete all the char it means that we don't have a common prefix
    if longestPrefix.count == 0 {
        return longestPrefix
    }
    
    return longestPrefix
}
