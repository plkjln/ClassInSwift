//
//  StackQueuePalindrome.swift
//  StackQueues
//
//  Created by PJln on 4/29/16.
//  Copyright © 2016 Plk Jln. All rights reserved.
//

import Foundation
//Custom structure for a Stack
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
//Custom structure for Enqueue
struct Queue<Element> {
    var items = [Element]()
    mutating func enqueue(item: Element) {
        items.append(item)
    }
    mutating func dequeue() -> Element {
        return items.removeFirst()
    }
}

class Solution {
    var stack = Stack<Character>()
    var queue = Queue<Character>()
    
    func pushCharacter(ch: Character) {
        stack.push(ch)
    }
    
    func popCharacter() -> Character {
        return stack.pop()
    }
    
    func enqueueCharacter(ch: Character) {
        queue.enqueue(ch)
    }
    
    func dequeueCharacter() -> Character {
        return queue.dequeue()
    }
}

// read the string s.
let s = readLine()!

// create the Solution class object p.
let obj = Solution()

// push/enqueue all the characters of string s to stack.
for c in s.characters {
    obj.pushCharacter(c)
    obj.enqueueCharacter(c)
}

var isPalindrome = true
// pop the top character from stack then dequeue the first character from queue and compare both the characters.
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

/* INPUT
abcba
OUTPUT
The word, abcba, is a palindrome.
Program ended with exit code: 0
*/
