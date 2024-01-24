//
//  2 x n 타일링2 11727.swift
//  Baekjoon
//
//  Created by mino on 2024/01/24.
//

import Foundation

let N = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 1000 + 1)

if N == 1 {
    print(1)
} else {
    dp[1] = 1
    dp[2] = 3
    dp[3] = 5
    
    for i in 4..<1001 {
        dp[i] = (dp[i - 1] + dp[i - 2] * 2) % 10007
    }
    print(dp[N])
}
