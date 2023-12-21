//
//  회사에있는사람 7785.swift
//  Baekjoon
//
//  Created by mino on 2023/12/21.
//

import Foundation

let N = Int(readLine()!)!

var check: Set<String> = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let name = input[0], behavior = input[1]
    if behavior == "enter" {
        check.insert(name)
    } else {
        check.remove(name)
    }
}

print(Array(check).sorted(by: >).joined(separator: "\n"))
