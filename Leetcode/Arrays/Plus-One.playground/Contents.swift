/*
 Given an non-empty array of digits representing a non-negative integer, plus one
 to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list
 and each element in the array contain a single digit.
 
 You may asume the integer does not contain any leading zero, except the number 0
 itself.
 
 Example:
 Input: [1,2,3]
 Output: [1,2,4]
 
 Example:
 Input: [9,9,9]
 Output: [1,0,0,0]
 */

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    
    for i in stride(from: digits.count-1, to: -1, by: -1) {
        if digits[i] == 9 {
            result[i] = 0
        } else {
            result[i] += 1
            return result
        }
    }
    
    if result.first == 0 {
        result.insert(1, at: 0)
    }
    
    return result
}
