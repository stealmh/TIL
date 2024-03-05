//
//  히오스프로게이머16564.swift
//  Baekjoon
//
//  Created by mino on 2024/03/05.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let K = input[1]

var characters = [Int]()

for _ in 0 ..< N {
    let character = Int(readLine()!)!
    characters.append(character)
}

characters.sort(by: <)

/// 목표레벨 = mid 이값이 최대치일 때를 구하기

var start = characters.first!
var end = start + K
var result = 0

while start <= end {
    let mid = (start + end) / 2
    
    var total = 0
    
    for i in characters {
        if mid > i {
            total += mid - i
        }
    }
    
    if total <= K {
        start = mid + 1
        result = max(result, mid)
    } else {
        end = mid - 1
    }
}

print(result)
