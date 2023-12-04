//
//  행렬덧셈2738.swift
//  Baekjoon
//
//  Created by DEV IOS on 2023/12/04.
//

import Foundation
////
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var metrix = Array(repeating: Array(repeating:0, count: m), count: n)
print(metrix)
for _ in 0 ..< 2 {

    for i in 0 ..< n {
        let value = readLine()!.split(separator: " ").map { Int($0)! }

        for j in 0 ..< m {
            metrix[i][j] += value[j]
        }
    }

}

for row in metrix {
    print(row.map { "\($0)" }.joined(separator: " "))
}
