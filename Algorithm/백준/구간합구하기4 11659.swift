//
//  구간합구하기4 11659.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var value = readLine()!.split(separator: " ").map { Int($0)! }

var original = value

for (idx, _) in value.enumerated() {
    if idx == 0 { continue }
    value[idx] += value[idx - 1]
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0] - 1
    let end = input[1] - 1

    if start == 0 {
        print(value[end])
        continue
    }
    
    if start == end {
        print(original[end])
        continue
    }
    
    if start >= 1 {
        print(value[end] - value[start - 1])
        continue
    }

}

