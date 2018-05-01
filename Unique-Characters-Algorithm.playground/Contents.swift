// Given an string check if all the contained characters are unique

import Foundation

func isStringUnique(element: String) -> Bool {
    //evaluate trivial case
    guard element.characters.count < 128 else {
        return false
    }
    
    //match unicode representation - O(n)
    var list = Array<Bool?>(repeatElement(nil, count: 128))
    
    for scalar in element.unicodeScalars {
        let unicode = Int(scalar.value)
        
        if list[unicode] != nil {
            return false
        }
        list[unicode] = true
    }
    
    return true
}
