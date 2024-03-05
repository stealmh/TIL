//
//  요세푸스문제11866.swift
//  Baekjoon
//
//  Created by mino on 2024/03/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let N = input[0]
let K = input[1]

var queue: [Int] = []

var answer: [Int] = []


for i in 1 ..< N + 1 {
    queue.append(i)
}

while !queue.isEmpty {
    for _ in 0 ..< K - 1 {
        let value = queue.removeFirst()
        queue.append(value)
    }
    let removeValue = queue.removeFirst()
    answer.append(removeValue)
}

print("<\(answer.map { String($0) }.joined(separator: ", "))>")
