// Hash Algorithm Example
// A really straightforward implementation of a hash algorithm usign protocol and
// generic function


import Foundation

protocol Keyable {
    
    var keystring: String {get}
    
    //note: in this case hashValue operates as a function
    func hashValue(for key: String!, using buckets: Array<T>) -> Int
}

extension Keyable {
    
    //compute item hash
    func hashValue<T>(for key: String!, using buckets: Array<T>) -> Int {
        
        var remainder: Int = 0
        var divisor: Int = 0
        
        //trivial case
        guard key != nil else {
            return -1
        }
        
        for item in key.unicodeScalars {
            divisor += Int(item.value)
        }
        
        remainder = divisor % buckets.count
        return remainder
    }
}
