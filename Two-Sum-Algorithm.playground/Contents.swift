/*  Given an array of integers, return indices of the two numbers
    such that they add up to a specific target */

/*  Example:
    Given nums = [2, 7, 11, 15], target = 9
    Because nums[0] + nums[1] = 2 + 7 = 9
    Return [0, 1] */

public func twoSum(nums: [Int], target: Int) -> [Int] {
    // Allways try to use a dictionary to perform O(1)
    // We're going to check if the complementary number
    // is already in the dic.
    // If is not in our data structure we'll storage for furture use.
    var numberStorage: [Int : Int] = [:]
    var results: [Int] = []
    
    for i in 0..<nums.count {
        if numberStorage[target - nums[i]] != nil {
            results.append(numberStorage[target - nums[i]]!)
            results.append(i)
            return results
        }
        
        numberStorage[nums[i]] = i
    }
    
    return []
}

print(twoSum(nums: [0, 7, 2, 15], target: 9))
