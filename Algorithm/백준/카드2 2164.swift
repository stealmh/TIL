//
//  카드2 2164.swift
//  Baekjoon
//
//  Created by mino on 2023/12/28.
//

import Foundation

let N = Int(readLine()!)!

var value = Array(1...N)
var temp = 0


if N == 1 {
    print(1)
} else {
    while true {
        value[temp] = 0
        value.append(value[temp + 1])
        value[temp + 1] = 0
        
        if value[value.count - 2] == 0 {
            print(value.last!)
            break
        }
        
        temp += 2
    }
}
