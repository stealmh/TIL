//
//  부분수열의합1182.swift
//  Baekjoon
//
//  Created by mino on 2024/03/13.
//

import Foundation

let nsInput = readLine()!.split(separator: " ").map { Int($0)! }
let n = nsInput[0]
let s = nsInput[1]

var value = readLine()!.split(separator: " ").map { Int($0)! }
var sumValue: [Int] = []
var answerCount = 0

func back(idx: Int) {
    
    if !sumValue.isEmpty && sumValue.reduce(0, +) == s {
        answerCount += 1
    }
    
    for i in idx..<n {
        sumValue.append(value[i])
        back(idx: i + 1)
        sumValue.removeLast()
    }
}

back(idx: 0)
print(answerCount)
