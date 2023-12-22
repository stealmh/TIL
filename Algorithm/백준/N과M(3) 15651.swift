//
//  N과M(3) 15651.swift
//  Baekjoon
//
//  Created by mino on 2023/12/22.
//
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]

var result: [Int] = []
var str: String = ""

recur(0)

func recur(_ depth: Int) {
    if depth == M  {
        str += result.map { String($0) }.joined(separator: " ")
        str += "\n"
        
        return
    }
    
    for i in 1...N {
        result.append(i)
        recur(depth + 1)
        result.popLast()!
    }
}

print(str)
