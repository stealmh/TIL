//
//  보물 1026.swift
//  Baekjoon
//
//  Created by mino on 2024/03/15.
//

import Foundation

let n = Int(readLine()!)!

var a = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var b = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

var result = 0
for i in 0 ..< n{
    result += a[i] * b[i]
}

print(result)
