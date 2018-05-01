/*
 * URLify Algorithm
 * Given a string find and replace all the withe spaces with %20
 */

import Foundation

func urlify(s: String) -> String {
    let replacedString = s.replacingOccurrences(of: " ", with: "%20")
    return replacedString
}

urlify(s: "Hello Wold")
