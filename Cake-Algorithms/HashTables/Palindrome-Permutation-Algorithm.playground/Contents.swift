func palindromePermutation(string: String) -> Bool {
    var charOcurrences: [String : Int] = [:]
    
    for s in string {
        charOcurrences[String(s)]! += 1
    }
    
    var oddValueFound = false
    for value in charOcurrences.values {
        if (value % 2 == 1) {
            if (oddValueFound) {
                return false
            }
            oddValueFound = true
        }
    }
    
    return oddValueFound
}

print(palindromePermutation(string: "aabcbcd"))

//"aabcbcd"
//"aabccbdd"
//"aabcd"
//"aabbcd"
