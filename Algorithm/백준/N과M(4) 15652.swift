//
//  N과M(4) 15652.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var result: [Int] = []

recur()

func recur() {
    
    if result.count == M {
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...N {
        if result.isEmpty || !result.isEmpty && result.last! <= i {
            result.append(i)
            recur()
            result.popLast()!
        }
    }
}
