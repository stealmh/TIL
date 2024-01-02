//
//  1로 만들기 1463.swift
//  Baekjoon
//
//  Created by mino on 2024/01/02.
//

import Foundation

let N = Int(readLine()!)!

switch N {
case 1:
    print(0)
case 2...3:
    print(1)
default:
    var dp = [Int](repeating: 0, count: N + 1)
    dp[1] = 0
    dp[2] = 1
    dp[3] = 1
    dp[4] = min(dp[3] + 1, dp[2] + 1)

    for i in 5...N {
        dp[i] = dp[i - 1] + 1
        
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i / 2] + 1)
        }
        
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i / 3] + 1)
        }
    }

    print(dp[N])
}
