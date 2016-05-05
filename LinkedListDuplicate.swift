//
//  main.swift
//  LinkedListDuplicate
//
//  Created by P Jln on 5/5/16.
//  Copyright © 2016 Plk Jln. All rights reserved.
//

import Foundation

// Revoming duplicate values from interger values values by the user using Linked List

// Start of class Node
class Node {
    var data: Int
    var next: Node?
    
    init(d: Int) {
        data = d
    }
} // End of class Node

// Start of class LinkedList
class LinkedList {
    func insert(head: Node?, data: Int) -> Node? {
        if head == nil {
            return Node(d: data)
        }
        head?.next = insert(head?.next, data: data)
        
        return head
    }
    
    func display(head: Node?) {
        if head != nil {
            print(head!.data, terminator: " ")
            
            display(head?.next)
        }
    }
    
    // Start of function removeDuplicates
    func removeDuplicates(head: Node?) -> Node? {
        
        // travel along the list removing the current node if the current node previous node
        // have the same value
        if let head = head {
            while let next = head.next where next.data == head.data {
                // remove the duplicate
                head.next = next.next
            }
            head.next = removeDuplicates(head.next)
            return head
        } else {
            return nil
        }

    } // End of function removeDuplicates
} // End of class LinkedList

var head: Node?
var linkedList = LinkedList()
var t = Int(readLine()!)! // total no. of inputs to be taken

while t-- > 0 {
    head = linkedList.insert(head, data: Int(readLine()!)!) // Numbers for the linked list
}

linkedList.display(linkedList.removeDuplicates(head)) // Displaying the numbers in the list

/*INPUT
6
1
2
2
3
3
4
OUTPUT
1 2 3 4 Program ended with exit code: 0
*/
