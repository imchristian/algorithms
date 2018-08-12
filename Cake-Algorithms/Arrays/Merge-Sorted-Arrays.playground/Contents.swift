/*
 Give two arrays
 let myArray = [3, 4, 6, 10, 11, 15]
 let alicesArray = [1, 5, 8, 12, 14, 19]
 
 Merged sorted
 print(mergeArrays(myArray, alicesArray))
 // [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
 */

func mergeSortedArrays(myArray: [Int], alicesArray: [Int]) -> [Int] {
    var mergedArray = myArray+alicesArray
    
    return quickSort(a: mergedArray)
}

func quickSort(a: [Int]) -> [Int] {
    guard a.count > 1 else {
        return a
    }
    
    let pivot = a[a.count / 2]
    let less = a.filter {$0 < pivot}
    let equal = a.filter {$0 == pivot}
    let greater = a.filter {$0 > pivot}
    return quickSort(a: less) + equal + quickSort(a: greater)
}


print(mergeSortedArrays(myArray: [3, 4, 6, 10, 11, 15], alicesArray: [1, 5, 8, 12, 14, 19, 21, 2]))
