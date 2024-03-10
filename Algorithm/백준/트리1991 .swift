//
//  트리1991 .swift
//  Baekjoon
//
//  Created by mino on 2024/03/08.
//

import Foundation

struct Node {
    var root: String
    var left: String
    var right: String
}

func preOrder(node: Node) {
    print(node.root, terminator: "")
    if node.left != "." {
        preOrder(node: tree[node.left]!)
    }
    
    if node.right != "." {
        preOrder(node: tree[node.right]!)
    }
}

func inOrder(node: Node) {
    if node.left != "." {
        inOrder(node: tree[node.left]!)
    }
    print(node.root, terminator: "")
    if node.right !=  "." {
        inOrder(node: tree[node.right]!)
    }
}

func postOrder(node: Node) {
    if node.left != "." {
        postOrder(node: tree[node.left]!)
    }
    
    if node.right != "." {
        postOrder(node: tree[node.right]!)
    }
    print(node.root, terminator: "")
}

var tree: [String: Node] = [:]

let n = Int(readLine()!)!

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    tree[input[0]] = Node(root: input[0],
                          left: input[1],
                          right: input [2])
}

let startNode = tree["A"]!
preOrder(node: startNode)
print()
inOrder(node: startNode)
print()
postOrder(node: startNode)
