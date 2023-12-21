//
//  14425 문자열집합.swift
//  Baekjoon
//
//  Created by mino on 2023/12/21.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var a: Set<String> = []
var count = 0

for _ in 0..<N {
    let value = readLine()!
    a.insert(value)
}

for _ in 0..<M {
    let value = readLine()!
    count += a.contains(value) ? 1 : 0
}


print(count)
