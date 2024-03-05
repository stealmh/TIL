//
//  탑 2493.swift
//  Baekjoon
//
//  Created by mino on 2024/03/05.
//

import Foundation

let N = Int(readLine()!)!

let topList = readLine()!.split(separator: " ").map { Int($0)! }

var answer = [Int](repeating: 0, count: N)

var stack: [Int] = []

for i in stride(from: N - 1, to: -1, by: -1) {
    while !stack.isEmpty && topList[i] > topList[stack.last!] {
        let idx = stack.removeLast()
        answer[idx] = i + 1
    }
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
