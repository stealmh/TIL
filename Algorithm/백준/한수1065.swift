//
//  한수1065.swift
//  Baekjoon
//
//  Created by mino on 2023/12/05.
//

import Foundation
/// 숫자를 입력받음
var N = Int(readLine()!)!
var count = 0
// 1. 숫자가 2자리수 이하라면 무조건 한수!
if N < 100 {
    print(N)
} else {
    for i in 100...N {
        let first = i / 100
        let second = (i % 100) / 10
        let third = (i % 100) % 10
        
        if first - second == second - third {
            count += 1
        }
    }
    print(count + 99)
}
