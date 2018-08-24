/*
 Given nums = [0,0,1,1,1,2,2,3,3,4],
 
 Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.
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
