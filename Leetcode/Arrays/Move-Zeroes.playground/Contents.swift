/*
 Given an array nums, write a function to move all 0's to the end of it while
 maintaining the relative order of the non-zero elements
 
 Example:
 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 
 Note: You must do this in-place without making a copy of the array
 Minimize the total number of operations
 */

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    nums = nums.filter { $0 != 0 }
    for _ in 0 ..< (count - nums.count) {
        nums.append(0)
    }
}
