//
//  제로10773.swift
//  Baekjoon
//
//  Created by mino on 2023/12/06.
//

import Foundation

let K = Int(readLine()!)!
var array: [Int] = []

for _ in 0 ..< K {
    let input = Int(readLine()!)!
    
    switch input {
    case 0:
        array.popLast()
    default:
        array.append(input)
    }
}

print(array.reduce(0, { $0 + $1 }))
