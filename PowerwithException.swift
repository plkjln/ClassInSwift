//
//  PowerwithException.swift
//  exceptions
//
//  Created by Plk Jln on 4/28/16.
//  Copyright © 2016 PJln. All rights reserved.
//

import Foundation
import Darwin

//Approach(A): with self logic.

// Defining enum for throwing error
// throw RangeError.NotInRange... is used to throw the error
enum RangeError : ErrorType {
    case NotInRange(String)
}

// Start of class Calculator
class Calculator {
    // Start of function power
    func power(n: Int, p: Int) throws -> Int {
        var res = 0
        if n >= 0 && p >= 0 {
            if n > 0 && p > 0 {
                res = n
                for _ in 2...p {
                    res = res * n
                }
            } else {
                if p == 0 {
                    res = 1
                }
                if n == 0 {
                    res = 0
                }
            }
        return res
        } else {
        throw RangeError.NotInRange("n and p should be non-negative")
        }
    } // End of function power
} // End of class Calculator

let myCalculator = Calculator()
var t = Int(readLine()!)!

while (t-- > 0) {
    let np = readLine()!.characters.split(" ").map(String.init)
    
    do {
        let ans = try myCalculator.power(Int(np[0])!, p: Int(np[1])!)
        print(ans)
    } catch RangeError.NotInRange(let errorMsg) {
        print(errorMsg)
    }
}



//Approach(B): with Swift's inbuilt POW function

enum RangeError : ErrorType {
    case NotInRange(String)
}

// Start of class Calculator
class Calculator {
    // Start of function power
    func power(n: Int, p: Int) throws -> Int {
        var res = 0.0
        if n >= 0 && p >= 0 {
            res = pow(Double(n), Double(p)) // Power works with float(powf) and double
            return Int(res)
        } else {
            throw RangeError.NotInRange("n and p should be non-negative")
        }
    } // End of function power
} // End of class Calculator

let myCalculator = Calculator()
var t = Int(readLine()!)! // Total set of inputs to be taken

while (t-- > 0) {
    let np = readLine()!.characters.split(" ").map(String.init)
    
    do {
        let ans = try myCalculator.power(Int(np[0])!, p: Int(np[1])!)
        print(ans)
    } catch RangeError.NotInRange(let errorMsg) {
        print(errorMsg)
    }
}

/* For both the above approach:
INPUT
10  // t
10 0
Output: 1
0 10
Output: 0
-1 4
Output: n and p should be non-negative
2 -3
Output: n and p should be non-negative
-2 -2
Output: n and p should be non-negative
5 6
Output: 15625
3 3
Output: 27
8 0
Output: 1
2 3
Output: 8
3 -3
Output: n and p should be non-negative
Program ended with exit code: 0
*/
