//
//  덩치7568.swift
//  Baekjoon
//
//  Created by mino on 2023/12/11.
//

import Foundation

/// input
let input = Int(readLine()!)!

var rank: [[Int]] = []
var answer: [Int] = Array(repeating: input, count: input)

for _ in 0 ..< input {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    rank.append(input)
}

for i in 0..<input {
    for j in 0..<input {
        if !(i == j) {
            if rank[i][0] >= rank[j][0] && rank[i][1] >= rank[j][1] {
                answer[i] -= 1
            }

            else if (rank[i][0] > rank[j][0] && rank[i][1] < rank[j][1]) ||
                    (rank[i][0] < rank[j][0] && rank[i][1] > rank[j][1]) ||
                    (rank[i][0] == rank[j][0] && rank[i][1] >= rank[j][1]) ||
                    (rank[i][0] >= rank[j][0] && rank[i][1] == rank[j][1]) ||
                    (rank[i][0] == rank[j][0] && rank[i][1] == rank[j][1]) ||
                    (rank[i][0] >= rank[j][0] && rank[i][1] < rank[j][1]) ||
                    (rank[i][0] < rank[j][0] && rank[i][1] >= rank[j][1]) {
                
                answer[i] -= 1
            }

        }
    }
}
