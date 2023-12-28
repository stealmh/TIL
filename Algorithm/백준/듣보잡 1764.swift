//
//  듣보잡 1764.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

struct Name {
    let name: String
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]

var nameArray: [Int: String] = [:]
var answer: [String] = []
var count = 0

for _ in 0..<N {
    let NInput = readLine()!
    let name = Name(name: NInput).name.hashValue
    nameArray[name] = NInput
}

for _ in 0..<M {
    let MInput = readLine()!
    let name = Name(name: MInput).name.hashValue
    if let value = nameArray[name] {
        answer.append(value)
        count += 1
    }
}

print(count)
print(answer.sorted().joined(separator: "\n"))
