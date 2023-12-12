//
//  좌표정렬하기11650.swift
//  Baekjoon
//
//  Created by mino on 2023/12/12.
//

import Foundation

let n = Int(readLine()!)!

var graph: [[Int]] = []

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

graph.sort { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }

for i in graph {
    print("\(i[0]) \(i[1])")
}
