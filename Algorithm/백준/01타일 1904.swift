//
//  01타일 1904.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1000000 + 1)
dp[0] = 0
dp[1] = 1
dp[2] = 2

if N < 3 {
    print(N)
} else {
    for i in 3...N {
        dp[i] = (dp[i - 2] + dp[i - 1]) % 15746
    }
    
    print(dp[N])
}
