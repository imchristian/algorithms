// Quick Sort Example Algorithm

import Foundation

extension Array where Element: Comparable {
    mutating func quickSort() -> Array<Element> {
        func qSort(start startIndex: Int, _ pivot: Int) {
            if (startIndex < pivot) {
                let iPivot = qPartition(start: startIndex, pivot)
                qSort(start: startIndex, iPivot - 1)
                qSort(start: iPivot + 1, pivot)
            }
        }
        qSort(start: 0, self.endIndex - 1)
        return self
    }
    
    // Sorts selected pivot
    mutating func qPartition(start startIndex: Int, _ pivot: Int) -> Int {
        var wallIndex: Int = startIndex
        
        // comparte range with pivot
        for currentIndex in wallIndex..<pivot {
            if self[currentIndex] <= self[pivot] {
                if wallIndex != currentIndex {
                    self.swapAt(currentIndex, wallIndex)
                }
                // advance wall
                wallIndex += 1
            }
        }
        // move pivot to final position
        if wallIndex != pivot {
            self.swapAt(wallIndex, pivot)
        }
        return wallIndex
    }
}

// execute sort
var sequence: Array<Int> = [7, 2, 1, 6, 8, 5, 3, 4]
let results = sequence.quickSort()
print(results)

