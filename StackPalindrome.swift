//
//  StackPalindrome.swift
//  StackPushPop
//
//  Created by PJln on 4/29/16.
//  Copyright © 2016 Plk Jln. All rights reserved.
//

import Foundation

class Solution {
    var stack = "" // Array can be used istead of string
    
    //pushes a character onto a stack
    func pushCharacter(ch: Character) -> Void {
        stack.append(ch)
        print("Stack: \(stack)") // To check each character of the string being pushed into the stack
    }
    
    //pops and returns the character at the top of the stack instance variable.
    func popCharacter() -> Character {
        let pop: Character = stack.characters.last!
        
        return pop
    }
    //dequeues and returns the first character in the queue instance variable.
    func dequeueCharacter() -> Character {
        let deq: Character = stack.characters.first!
        
        return deq
    }
}

// read the string s.
let s = readLine()! // String which needs to checked for Palindrome

// create the Solution class object p.
let obj = Solution()

// push/enqueue all the characters of string s to stack.
for c in s.characters {
    obj.pushCharacter(c)
}

var isPalindrome = true
// pop the top character from stack thendequeue the first character from queue and finally compare both the characters.
var range = s.characters.count / 2
for i in 0..<range {
    if obj.popCharacter() != obj.dequeueCharacter() {
        isPalindrome = false
        
        break
    }
}
// finally print whether string s is palindrome or not.
if isPalindrome {
    print("The word, \(s), is a palindrome.")
} else {
    print("The word, \(s), is not a palindrome.")
}

/*INPUT
abcba
OUTPUT
Stack: a
Stack: ab
Stack: abc
Stack: abcb
Stack: abcba
The word, abcba, is a palindrome.
Program ended with exit code: 0

INPUT
palindrome
OUTPUT
Stack: p
Stack: pa
Stack: pal
Stack: pali
Stack: palin
Stack: palind
Stack: palindr
Stack: palindro
Stack: palindrom
Stack: palindrome
The word, palindrome, is not a palindrome.
Program ended with exit code: 0
*/
