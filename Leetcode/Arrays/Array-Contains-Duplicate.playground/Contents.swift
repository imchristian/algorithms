/*
 Given an array of integers, find if the array contains any duplicates.
 
 Your function should return true if any value appears at least twice in the array
 and it should return false if every element is distinct
 
 Example:
 Input: [1,2,3,1]
 Output: true
 */

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    var countWords = [String: Int]()
    
    for num in nums {
        if (countWords[String(num)] != nil) {
            return true
        } else {
            countWords[String(num)] = 1
        }
    }
    return false
}
