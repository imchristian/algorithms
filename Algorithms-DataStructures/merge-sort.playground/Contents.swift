public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    let left = Array(array[..<middle]))
    let right = Array(array[middle...]))
    
    return merge(mergeSort(left), mergeSort(right))
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    var left = left
    var right = right
    var result: [Element] = []
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            result.append(left.removeFirst())
        } else {
            result.append(right.removeFirst())
        }
    }
    
    return result + left + right
}


example(of: "merge sort") {
let array = [7, 2, 6, 3, 9]
print("Original: \(array)")
print("Merge sorted: \(mergeSort(array))")
}





