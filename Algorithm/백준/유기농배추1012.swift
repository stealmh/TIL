//
//  유기농배추1012.swift
//  Baekjoon
//
//  Created by mino on 2023/12/07.
//

import Foundation

let T = Int(readLine()!)!
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var farm: [[Int]] = []

var width = 0
var height = 0

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let M = input[0]
    let N = input[1]
    let K = input[2]
    
    width = M
    height = N
    var count = 0
    
    farm = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    for _ in 0 ..< K {
        let farmPosition = readLine()!.split(separator: " ").map { Int($0)! }
        let farmX = farmPosition[0]
        let farmY = farmPosition[1]
        farm[farmY][farmX] = 1
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if farm[i][j] == 1 {
                dfs(i,j)
                count += 1
            }
        }
    }
    print(count)
    count = 0
}

func dfs(_ y: Int, _ x: Int) {
    if x < 0 || y < 0 || x >= width || y >= height {
        return
    }

    if farm[y][x] == 1 {
        farm[y][x] = 0

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            dfs(ny, nx)
        }
    }
}
