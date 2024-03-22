//
//  포도주시식 2156.swift
//  Baekjoon
//
//  Created by mino on 2024/03/22.
//

import Foundation

/*
 6, 10, 13, 9, 8, 1
 dp[1] = 6
 dp[2] = 16
 dp[3] = 23
 
 1. 현재꺼를 먹고 2번째 이전꺼를 먹는경우
 2. 현재꺼롤 먹고 전꺼를 먹는 경우
 3. 2번째 전꺼와 전꺼를 먹는경우
 
 가장 큰 경우가 답
 
 
 */

var dp = Array(repeating: 0, count: 10000 + 1)
var wineArray = Array(repeating: 0, count: 10000 + 1)

let n = Int(readLine()!)!
for i in 0..<n {
    let wine = Int(readLine()!)!
    wineArray[i + 1] = wine
//    wineArray.append(wine)
}

dp[1] = wineArray[1]
dp[2] = wineArray[1] + wineArray[2]
dp[3] = max(wineArray[3] + wineArray[1], wineArray[3] + wineArray[2], dp[2])

if n >= 4 {
    for i in 4...n {
        dp[i] = max(wineArray[i] + dp[i - 2], wineArray[i] + wineArray[i - 1] + dp[i - 3], dp[i - 1])
    }
}
print(dp.sorted(by: >)[0])

