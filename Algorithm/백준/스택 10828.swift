//
//  스택 10828.swift
//  Baekjoon
//
//  Created by mino on 2023/12/29.
//

import Foundation

let N = Int(readLine()!)!
var stack: [String] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    var order: String = ""
    var value: String = ""
    order = input[0]
    if input.count > 1 { value = input[1] }
    
    switch order {
    case "push":
        stack.append(value)
    case "pop":
        print(stack.isEmpty ? "-1" : stack.popLast()!)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? "1" : "0")
    case "top":
        print(stack.isEmpty ? "-1" : stack.last!)
    default: break
    }
}
