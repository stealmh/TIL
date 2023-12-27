//
//  정수삼각형 1932.swift
//  Baekjoon
//
//  Created by mino on 2023/12/27.
//

import Foundation

let N = Int(readLine()!)!

var checkValue = [[Int]](repeating: [Int](repeating: 0, count: 1), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    checkValue[i] = input
}

for i in 1..<N {
    
    for j in 0..<checkValue[i].count {
        if j == 0 {
            checkValue[i][j] = checkValue[i][j] + checkValue[i - 1][0]
        } else if j == checkValue[i - 1].count {
            checkValue[i][j] = checkValue[i][j] + checkValue[i - 1][j - 1]
        } else {
            checkValue[i][j] = checkValue[i][j] + max(checkValue[i - 1][j - 1], checkValue[i - 1][j])
        }
    }
}

print(checkValue[N - 1].max()!)
