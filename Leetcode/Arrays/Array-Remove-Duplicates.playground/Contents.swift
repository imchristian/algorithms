/*
 Given a sorted array nums, remove the duplicates in-place such that each element
 appear only once and return the new length.
 
 Do not allocate extra space for another array,
 you must do this by modifying the input array in-place with O(1) extra memory.
 */

/*
 Example
 Given nums = [1,1,2]
 Your function should return length = 2
 */

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var index = 0
    
    for num in nums {
        if num != nums[index] {
            index += 1
            nums[index] = num
        }
    }
    
    nums.removeSubrange(index+1..<nums.count)
    return nums.count
}
