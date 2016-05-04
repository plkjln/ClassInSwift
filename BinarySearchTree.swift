//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by P Jln on 5/3/16.
//  Copyright © 2016 Plk Jln. All rights reserved.
//
/*
 Creating a Binary Search Tree(BST) and finding its height(Longest distance from Root node to child most Node)
Example:  3       // root; node 1
         / \      // edge 1
        2   5     // node 2
      /    / \    // edge 2
    1     4   7   // node 3
            /     // edge 3
            6     // longest leaf; node 4
There are 4 nodes in this path that are connected by 3 edges, meaning our BST's height=3. Thus, we print 3 as our answer for this BST.
 */
 
import Foundation

// Start of class Node: Structure for the BST
class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(d : Int) {
        data  = d
    }
} // End of class Node

// Start of class Tree: Adding values and creating the BST
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
    // calculating the Height of the Binary Tree
    func getHeight(root: Node?) -> Int {
        if (root == nil) {
            return -1
        }
        let lefth = getHeight(root?.left)
        let righth = getHeight(root?.right)
       
        if(lefth > righth) {
            return lefth + 1
        } else {
            return righth + 1
        }

    } // End of function getHeight
} // End of class Tree

var root: Node?
var tree = Tree()

var t = Int(readLine()!)! //Total No. of nodes in the BST

//Creating the Binary Tree: input the elements for each node
while t-- > 0 {
    root = tree.insert(root, data: Int(readLine()!)!)
}

print("Height of the tree: \(tree.getHeight(root))") //Height of the BST

/* INPUT
7 // Total nodes in BST
3 // Root
5
4
7
2
1
6
OUTPUT
Height of the tree: 3
Program ended with exit code: 0

INPUT
6 // Total nodes in BST
3 // Root 
5
4
7
2
1
OUTPUT
Height of the tree: 2
*/
