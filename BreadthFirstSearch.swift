//
//  BreadthFirstSearch.swift
//  BreadthFirstSearch
//
//  Created by P Jln on 4/13/16.
//  Copyright © 2016 Plk Jln. All rights reserved.
//

/*A level-order traversal, also known as a breadth-first search, visits each level of a tree's nodes from left to right, top to bottom. 
Creating a Binary Search Tree(BST) and finding its level(from Root node to child most Node, left to right, top to bottom)
Example:  3       // root; level 0
         / \      
        2   5     // level 1
      /    / \    
     1    4   7   // level 2

We traverse each level of the tree from the root downward, and we process the nodes at each level from left to right. 
The resulting level-order traversal is 3→2→5→1→4→7, and we print these data values as a single line of space-separated integers.
*/

// Start of class Node
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(d : Int) {
        data  = d
    }
} // End of class Node

// Start of class Tree
class Tree {
    func insert(root: Node?, data: Int) -> Node? {
        if root == nil {
            return Node(d: data)
        }
        if data <= root?.data {
            root?.left = insert(root?.left, data: data)
        } else {
            root?.right = insert(root?.right, data: data)
        }
        return root
    }
    
    func levelOrder(root: Node?) {
        if (root == nil) {
            print("0")
        }
        var output: [[Int]] = [] // level wise separation of nodes
        var result: [Int] = []   // all nodes is a particular level 
        var queue: [Node] = [root!]
        var queueNext: [Node] = []
        while queue.count > 0 {
            for node in queue {
                result.append(node.data)
                if node.left != nil {
                    queueNext.append(node.left!)
                }
                if node.right != nil {
                    queueNext.append(node.right!)
                }
            }
            output.append(result)
            result.removeAll(keepCapacity: true)
            queue = queueNext
            queueNext.removeAll(keepCapacity: true)
        }
       print("BFS is: \(output)")// Level wise separated nodes in BST

    } // End of function levelOrder
} // End of class Tree

var root: Node?
var tree = Tree()

var t = Int(readLine()!)!

while t-- > 0 {
    root = tree.insert(root, data: Int(readLine()!)!)
}
tree.levelOrder(root)

/*INPUT
6 // Total number of nodes in BST
3 // Root data
5
4
7
2
1
OUTPUT
BFS is: [[3], [2, 5], [1, 4, 7]]
Program ended with exit code: 0
*/
