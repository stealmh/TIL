//
//  셀프넘버 4673.swift
//  Baekjoon
//
//  Created by mino on 2023/12/22.
//

import Foundation
let l = 10000
var `initializer`: Set<Int> = []

for i in 1...l {
    var value = i
    var summary = 0
    while value != 0 {
        summary += value % 10
        value /= 10
    }
    if summary <= l && summary + i <= l {
        initializer.insert(summary + i) // 셀프넘버가 있는것들
    }
    
    if !initializer.contains(i) {
        print(i)
    }
}

