//
//  N과M(2) 15650.swift
//  Baekjoon
//
//  Created by mino on 2023/12/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]

var result: [Int] = []
var answer: [[Int]] = []

recur()

func recur() {
    if result.count == M && !answer.contains(result.sorted()) {
        answer.append(result)
        return
    }
    
    for i in 1...N {
        if !result.contains(i) {
            result.append(i)
            recur()
            result.popLast()!
        }
    }
}

for i in answer {
    print(i.map { String($0) }.joined(separator: " "))
}
