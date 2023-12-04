//
//  세로읽기10798.swift
//  Baekjoon
//
//  Created by DEV IOS on 2023/12/04.
//

import Foundation

var metrix = Array(repeating: Array(repeating: "", count: 15), count: 5)
var answer: String = ""

var inputCount = 0

for i in 0 ..< 5 {
    let word = readLine()!.map { String($0) }
    let wordCount = word.count - 1
    metrix[i].replaceSubrange(0 ..< wordCount, with: word)
    
}

for i in 0 ..< 15 {
    for j in 0 ..< 5 {
        answer += metrix[j][i]
    }
}

print(answer)
