//
//  설탕배달2839.swift
//  Baekjoon
//
//  Created by mino on 2023/12/05.
//

import Foundation

var n = Int(readLine()!)!
var count = 0
/// 봉지는 3kg, 5kg 2개가 있음

while n >= 3 {
    if n % 5 == 0 {
        n -= 5
        count += 1
    } else {
        n -= 3
        count += 1
    }
}

print(n == 0 ? count : -1)
