//
//  좌표압축18870.swift
//  Baekjoon
//
//  Created by mino on 2023/12/12.
//

import Foundation

let n = Int(readLine()!)!
var original: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var SetOriginal = Set(original).sorted(by: <)
var aa: [Int: Int] = [:]

var answer: [String] = []

var dicCount = 0
for i in SetOriginal {
    aa[i] = dicCount
    dicCount += 1
}


for i in original {
    if let num = aa[i] {
        answer.append(String(num))
    }
}

print(answer.joined(separator: " "))
