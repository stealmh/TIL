//
//  토마토 7576.swift
//  Baekjoon
//
//  Created by mino on 2023/12/11.
//

import Foundation

/// input
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = input[0] // 가로
let N = input[1] // 세로

var farm: [[Int]] = []
var tomatoes: [[Int]] = []


let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
for i in 0 ..< N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    farm.append(input)

}

for i in 0 ..< N {
    for j in 0 ..< M {
        if farm[i][j] == 1 {
            tomatoes.append([i,j])
        }
    }
}

var index = 0
func bfs() {
    /// 1. isEmpty
    /// removeFirst의 시간복잡도 확인하기
    while tomatoes.count > index {
        let tomatoPosition = tomatoes[index]
        let tX = tomatoPosition[1]
        let tY = tomatoPosition[0]
        
        for i in 0 ..< 4 {
            let nx = tX + dx[i]
            let ny = tY + dy[i]
            
            if !(nx < 0 || nx >= M || ny < 0 || ny >= N) {
                if farm[ny][nx] == 0 {
                    farm[ny][nx] = farm[tY][tX] + 1
                    tomatoes.append([ny,nx])
                }
            }
        }
        index += 1
    }
}

bfs()

print(farm.flatMap{ $0 }.contains(0) ? -1 : farm.flatMap{ $0 }.max()! - 1)
