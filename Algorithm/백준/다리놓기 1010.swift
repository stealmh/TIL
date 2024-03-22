//
//  다리놓기 1010.swift
//  Baekjoon
//
//  Created by mino on 2024/03/22.
//

import Foundation

var dp = Array(repeating: Array(repeating: 0, count: 31), count: 31)

for i in 1...30 {
    for j in 1...30 {
        if i == j {
            dp[i][j] = 1
        } else if i == 1 {
            dp[i][j] = j
        } else {
            dp[i][j] = dp[i][j - 1] + dp[i - 1][j - 1]
        }
    }
}

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    print(dp[n][m])
}

