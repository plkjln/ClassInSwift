//
//  main.swift
//  Inheritance
//
//  Created by Abhay Dokania on 4/23/16.
//  Copyright © 2016 Abhay Dokania. All rights reserved.
//

import Foundation

/*2 classes, Person and Student, where Person: base class and Student:derived class. Student inherits all the properties of Person.
 A char calculate() method that calculates a Student object's average and returns the grade character representative of their 
 calculated average: 1. 90<= AVG >= 100: Grade = "O"
                     2. 80<= AVG >= 90:  Grade = "E"
                     3. 70<= AVG >= 80:  Grade = "A"
                     4. 55<= AVG >= 70:  Grade = "P"
                     5. 40<= AVG >= 55:  Grade = "D"
                     6. AVG < 40      :  Grade = "T"
 */

// Class Person
class Person {
    var firstName: String
    var lastName: String
    var id: Int
    // Initializer
    init(firstName: String, lastName: String, identification: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = identification
    }
    // Print person data
    func printPerson() {
        print("Name: \(self.lastName), \(self.firstName)")
        print("ID: \(self.id)")
    }
} // End of class Person

// Class Student
class Student: Person {
    var testScores: [Int]
    
    // Write the Student class initializer
    init(firstName: String, lastName: String, identification: Int, scores: [Int]) {
        self.testScores = scores
        super.init(firstName: firstName, lastName: lastName, identification: identification)
    }
    
    // Write the calculate method
    func calculate() -> Character {
        var avg = 0
        var scoreChar: Character = " "
        for marks in testScores {
            avg += marks
        }
        avg = avg / (testScores.count)
        
        switch avg {
        case 90...100: scoreChar = "O"
        case 80...90:  scoreChar = "E"
        case 70...80:  scoreChar = "A"
        case 55...70:  scoreChar = "P"
        case 40...55:  scoreChar = "D"
        default:       scoreChar = "T"
        }
        //print(scoreChar)
        return scoreChar
    }
    
} // End of class Student

let nameAndID = readLine()!.characters.split(" ").map{String($0)} // Heraldo Memelli 8135627
let scoreCount = readLine() // number of marks to be inputted
let scores = readLine()!.characters.split(" ").map{Int(String($0))!} // enter the different marks per subject (different marks = scoreCount)

let s = Student(firstName: nameAndID[0], lastName: nameAndID[1], identification: Int(nameAndID[2])!, scores: scores)

s.printPerson()

print("Grade: \(s.calculate())")

/*INPUT:
 Heraldo Memelli 8135627
 2
 100 80
 OUTPUT
 Name: Memelli, Heraldo
 ID: 8135627
 Grade: O */
