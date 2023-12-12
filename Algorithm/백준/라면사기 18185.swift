//
//  라면사기 18185.swift
//  Baekjoon
//
//  Created by mino on 2023/12/12.
//

import Foundation

let n = Int(readLine()!)!
var count = 0

var factory = readLine()!.split(separator: " ").map { Int($0)! }
factory.append(0)
factory.append(0)

for i in 0 ..< n {
    if factory[i + 1] > factory[i + 2] {
        let k = min(factory[i], factory[i + 1] - factory[i + 2])
        factory[i] -= k
        factory[i + 1] -= k
        count += (5 * k)

        let m = min(factory[i], factory[i + 1], factory[i + 2])
        factory[i] -= m
        factory[i + 1] -= m
        factory[i + 2] -= m
        count += (7 * m)
    } else {
        let m = min(factory[i], factory[i + 1], factory[i + 2])
        factory[i] -= m
        factory[i + 1] -= m
        factory[i + 2] -= m
        count += (7 * m)

        let b = min(factory[i], factory[i + 1])
        factory[i] -= b
        factory[i + 1] -= b
        count += (5 * b)
    }

    count += 3 * factory[i]
}

print(count)
