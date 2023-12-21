//
//  숫자카드2 10816.swift
//  Baekjoon
//
//  Created by mino on 2023/12/21.
//

import Foundation

let N = Int(readLine()!)!

var check: [Int: Int] = [:]

var Ninput = readLine()!.split(separator: " ").map { Int($0)! }
for i in Ninput {
    if let _ = check[i] {
        check[i]! += 1
    } else {
        check[i] = 1
    }
}

let M = Int(readLine()!)!
var Minput = readLine()!.split(separator: " ").map { Int($0)! }
var answer: [String] = []

for i in Minput {
    if let _ = check[i] {
        answer.append(String(check[i]!))
    } else {
        answer.append("0")
    }
}

print(answer.joined(separator: " "))
