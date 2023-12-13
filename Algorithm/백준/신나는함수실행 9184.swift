//
//  신나는함수실행 9184.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 1, count: 20 + 1), count: 20 + 1), count: 20 + 1)

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 {
        return 1
    }
    
    if a > 20 || b > 20 || c > 20 {
        return w(20, 20, 20)
    }
    
    // 메모이제이션
    // 중복된 값을 서칭하지 않도록 해줌
    if dp[a][b][c] != 1 {
        return dp[a][b][c]
    }
    
    if a < b && b < c {
        dp[a][b][c] = w(a,b,c-1) + w(a,b-1,c-1) - w(a, b-1, c)
        return dp[a][b][c]
    }
    
    dp[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
    return dp[a][b][c]
}

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input == [-1, -1, -1] { break }
    
    let a = input[0]
    let b = input[1]
    let c = input[2]
    
    print("w(\(a), \(b), \(c)) = \(w(a,b,c))")
}
