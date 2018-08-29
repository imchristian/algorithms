/*
 Given a string, determine if it is a palindrome, considering only alphanumeric
 characters and ignoring cases.
 
 Example:
 Input: "A man, a plan, a canal: Panama"
 Output: true
 */

import Foundation

func isPalindrome(_ s: String) -> Bool {
    let alphanumerics = CharacterSet.alphanumerics.inverted
    let str = s.components(separatedBy: alphanumerics).joined(separator: "").lowercased()
    
    let arr = Array(str)
    var reversedString = ""
    
    for i in stride(from: arr.count-1, to: -1, by: -1) {
        reversedString += String(arr[i])
    }
    
    if (str == reversedString) {
        return true
    }
    
    return false
}
