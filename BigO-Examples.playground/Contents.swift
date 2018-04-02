// Big O Algorithms Examples

// Example 1
func foo(array:[Int]) {
    var sum = 0
    var product = 1
    for i in 0..<array.count {
        sum += array[i]
    }
    
    for i in 0..<array.count {
        product *= array[i]
    }
    
    print("\(sum), \(product)")
}
/*
 * foo(array: [1, 15, 5])
 * This will take O(N) time. The fact that we iterate through the array twice doesn't matter
 */

// Example 2
func printPairs(array:[Int]) {
    for i in 0..<array.count {
        for j in 0..<array.count {
            print("\(array[i]) , \(array[j])")
        }
    }
}
/*
 * printPairs(array: [2,2])
 * The inner for loop has O(N) iterations and it is called N times. Therefore, the runtime is O(N square)
 */


// Example 3
func printUnorderedPairs(array: [Int]) {
    for i in 0..<array.count {
        for j in i+1..<array.count {
            print("\(array[i]),\(array[j])")
        }
    }
}
/*
 * printUnorderedPairs(array: [2,8,3])
 * Since the inner loop does N/2 work on avergae and it is run N time, the total work is
 * N square/2 which is O(N square)
 */

// Example 4
func printUnorderedPairs(arrayA: [Int], arrayB: [Int]) {
    for i in 0..<arrayA.count {
        for j in 0..<arrayB.count {
            if (arrayA[i] < arrayB[j]) {
                print("\(arrayA[i]),\(arrayB[j])")
            }
        }
    }
}
/*
 * printUnorderedPairs(arrayA: [1,2,3], arrayB: [4,5,6])
 * For each element of arrayA, the inner for loop goes through b iterations, where b = arrayB.lenght
 * if a = arrayA.lenght, then the runtime is O(ab)
 * If you said O(N square) then remember your mistake for the future. It's not O(N square) because the are two
 * different inputs. Both matter. This is an extremely common mistake
 */

// Example 5
func printUnorderedPairs1(arrayA:[Int], arrayB:[Int]) {
    for i in 0..<arrayA.count {
        for j in 0..<arrayB.count {
            for _ in 0..<100000 {
                print("\(arrayA[i]), \(arrayB[j])")
            }
        }
    }
}
/*
 * printUnorderedPairs1(arrayA: [1,2,3], arrayB: [4,5,6])
 * Nothing has really changed here. 100000 units of work is still constant, so the runtime is O(ab)
 */

// Example 6
func reverse(arr:[Int]) {
    var array = arr
    for i in 0..<array.count/2 {
        let other = array.count - i - 1
        let temp = array[i]
        array[i] = array[other]
        array[other] = temp
    }
}
/*
 * reverse(arr: [3,2,1])
 * This algorithm runs in O(N) time. The fact that it only goes through half of the array
 * does not impact the big O time
 */


// Example 11
func factorial(n: Int) -> Int {
    if (n < 0) {
        return -1
    } else if (n == 0) {
        return 1
    } else {
        return n * factorial(n:n - 1)
    }
}
/*
 * factorial(n: 4)
 * This is just a straight recursion from n to n-1 to n-2 down to 1
 * It will take O(N) time
 */


// Example 13
func fib(n: Int) -> Int {
    if (n <= 0) {
        return 0
    } else if (n == 1) {
        return 1
    }
    return fib(n: n - 1) + fib(n: n - 2)
}

/*
 * fib(n: 8)
 * There are 2 branches per call, and we go as deep as N
 * therefore the runtime is O(2 exp N)
 */

// Example 14
func allFib(n: Int) {
    for i in 0..<n {
        print("\(i) + : \(fibo(n: n))")
    }
}

func fibo(n: Int) -> Int {
    if (n <= 0) {
        return 0
    } else if (n == 1) {
        return 1
    }
    
    return fibo(n: n - 1) + fibo(n: n - 2)
}
/*
 * Many people will rush to concluding that since fib(n) takes O(2 exp n)
 * time and it's called n time, then it's O(n 2 exp n)
 * But that's not true, the error is that the n is changing.
 * Yes fib(n) takes O(2 exp n) but it matters what that value of n is
 * The correct anwser is O(2 exp n)
 */

// Example 16
func powersOf2(n: Int) -> Int {
    if (n < 1) {
        return 0
    } else if (n == 1) {
        print(1)
        return 1
    } else {
        let prev = powersOf2(n: n / 2)
        let curr = prev * 2
        print("\(curr)")
        return curr
    }
}

/*
 * powersOf2(n: 4)
 * The runtime, then, is the number of time we can divide n by 2
 * until we get down to the base case 1
 * The number of time we can halve n until we get 1 is O(log n)
 */






