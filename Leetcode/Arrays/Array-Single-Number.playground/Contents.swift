/*
 Given an non-empty array of integers, every element appears twice except for one.
 Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without
 using extra memory?
 
 
 Example:
 Input: [2,2,1]
 Output: 1
 */

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    
    for num in nums {
        res ^= num
    }
    return res
}
