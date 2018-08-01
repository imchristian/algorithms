//: Binary Search - O(log n)

import UIKit

let numbers = [1, 2, 4, 6, 8, 9, 11, 13, 16, 17, 20]

func binarySearch(searchValue: Int, array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        if middleValue == searchValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleValue - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleValue + 1
        }
    }
    
    return false
}

binarySearch(searchValue: 5, array: numbers)
