//
//  곱셈1629.swift
//  Baekjoon
//
//  Created by mino on 2024/03/05.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

var A = input[0]
let B = input[1]
let C = input[2]

func dfs(_ N: Int) -> Int {
    if N == 0 {
        return 1
    }

    if N % 2 == 0 {
        let result = dfs(N / 2)
        return result % C * result % C
    } else {
        let result = dfs((N - 1) / 2)
        return result % C * result % C * A % C
    }
}

print(dfs(B))
