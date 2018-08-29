/*
 Write a function that takes a string as input and returns the string reversed
 
 Example:
 Input: "hello"
 Output: "olleh"
 */

import Foundation

func reverseString(_ s: String) -> String {
    let arr = Array(s)
    var str = ""
    
    for i in stride(from: arr.count-1, to: -1, by: -1) {
        str += String(arr[i])
    }
    
    return str
}
