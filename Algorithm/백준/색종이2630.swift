//
//  색종이2630.swift
//  Baekjoon
//
//  Created by mino on 2024/03/05.
//

import Foundation

let N = Int(readLine()!)!
var area = [[Int]]()

for _ in 0 ..< N {
    let areaLine = readLine()!.split(separator: " ").map { Int($0)! }
    area.append(areaLine)
}

var whiteCount = 0
var blueCount = 0

func divide(x: Int, y: Int, n: Int) {
    var white = 0
    var blue = 0
    
    for height in y ..< y + n {
        for width in x ..< x + n {
            if area[height][width] == 0 {
                white += 1
            } else {
                blue += 1
            }
        }
    }
    
    if white == n * n {
        whiteCount += 1
        return
    }
    
    if blue == n * n {
        blueCount += 1
        return
    }
    
    /// 좌 상
    divide(x: x,
           y: y,
           n: n / 2)
    /// 우 상
    divide(x: x + n / 2,
           y: y,
           n: n / 2)
    /// 우 하
    divide(x: x + n / 2,
           y: y + n / 2,
           n: n / 2)
    /// 좌 하
    divide(x: x,
           y: y + n / 2,
           n: n / 2)
}
divide(x: 0, y: 0, n: N)

print(whiteCount)
print(blueCount)
