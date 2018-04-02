// Big O Exercises

// The following code computes the product of a and b.
func product(a: Int, b: Int) -> Int {
    var sum = 0
    for _ in 0..<b {
        sum += a
    }
    return sum
}
/* Answer: the for loop just iterates through b: O(b) */

// The following code computes a exp b.
func power(a: Int, b: Int) -> Int {
    if (b < 0) {
        return 0
    } else if (b == 0) {
        return 1
    } else {
        return a * power(a: a, b: b - 1)
    }
}
/* Answer: The recursive code iterates through b calls: O(b) */
 
 // The following code computes a % b
func mod(a: Int, b: Int) -> Int {
    if (b <= 0) {
        return -1
    }
    
    let div = a / b
    return a - div * b
}
/* Answer: It does a constant amount of work: O(1) */

// The following code performs integer division
func div(a: Int, b: Int) -> Int {
    var count = 0
    var sum = b
    while (sum <= a) {
        sum += b
        count += 1
    }
    return count
}

div(a: 4, b: 2)
/* Answer: The variable count will eventually equal to a/b. Therefore Big O is O(a/b) */

// The following code computes the integer square root of a number
func sqrt(n: Int) -> Int {
    return sqrt_helper(n: n, min: 1, max: n)
}

func sqrt_helper(n: Int, min: Int, max: Int) -> Int {
    if (max < min) {
        return -1 // no square root
    }
    
    let guess = (min + max) / 2
    if (guess * guess == n) { // found it!
        return guess
    } else if (guess * guess < n) { // too low
        return sqrt_helper(n: n, min: guess + 1, max: max) // try higher
    } else { // too high
        return sqrt_helper(n: n, min: min, max: guess - 1) // try lower
    }
}
/* Answer: This algorithm  is essentially doing a binary search to find the square root
   Therefore the runtime is O(log n) */

// The following code sums the digits in a number
func sumDigits(n: Int) -> Int {
    var num = n
    var sum = 0
    while  (num > 0) {
        sum += num % 10
        num /= 10
    }
    return sum
}
/* The runtime will be the number of digits in the number. A number with d digits can have
   value up to 10 exp d. If n = (10 exp d), then d = log n. Therefore, the runtime is O(log n) */




 
 
 
 
 
 
 
 
 












