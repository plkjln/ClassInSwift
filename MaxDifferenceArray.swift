//
//  MaxDifferenceArray.swift
//  Created by PJln on 4/25/16.
//  Copyright © 2016 P Jln. All rights reserved.
//
//The absolute difference between two integers, a and b, is written as |a−b|. The maximum absolute difference between two integers in a set of positive integers, elements, is the largest absolute difference between any two integers in elements.

import Foundation

class Difference {
    var elements = [Int]()
    var maximumDifference : Int!

    init(a: [Int]) {
        self.elements = a
        self.maximumDifference = 0
    }
    
    func computeDifference() -> Int! {
        
        elements.sortInPlace()//Approach 1
        maximumDifference = abs(elements[0] - elements[elements.count-1]) //Approach 1
        
        //maximumDifference = abs(elements.maxElement()! - elements.minElement()!)//uncomment for Approach 2 & comment Approach 1
        
        print("Max Diff: \(maximumDifference)")
        
        return maximumDifference
    }

} // End of Difference class

let N = Int(readLine()!)! // Number of elements inside the array 
let a = readLine()!.characters.split(" ").map(String.init).map{Int($0)!} // Array elements

let d = Difference(a: a)

d.computeDifference()

print(d.maximumDifference)

/*
INPUT
5
8 8 8 8 8
OUTPUT
Max Diff: 0
0
Program ended with exit code: 0

INPUT
5
5 19 7 1 4
Max Diff: 18
18
Program ended with exit code: 0
*/
