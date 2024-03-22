//
//  123더하기 9095.swift
//  Baekjoon
//
//  Created by mino on 2024/03/22.
//

import Foundation

/*
 n이 주어졌을 때 1,2,3의 합으로 나타낼 수 있는 방법의 수 구하기
 
 dp[0] = 0
 dp[1] = 1  (1)
 dp[2] = 2  (1+1, 2)
 dp[3] = 4  (1+1+1, 2+1, 1+2, 3)
 dp[4] = 7  (1+1+1+1, 1+1+2, 1+2+1, 2+1+1, 1+3, 3+1, 2+2)
 dp[5] = 13 (1+1+1+1+1, 1+1+2+1, 1+2+1+1, 2+1+1+1, 1+1+1+2, 1+3+1, 1+1+3, 3+1+1, 2+2+1, 1+2+2, 2+1+2, 3+2, 2+3)
 */

var dp = Array(repeating: 0, count: 11)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<11 {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
}

for _ in 0..<Int(readLine()!)! {
    let input = Int(readLine()!)!
    print(dp[input])
}
