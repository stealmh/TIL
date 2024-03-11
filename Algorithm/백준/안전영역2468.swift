//
//  안전영역2468.swift
//  Baekjoon
//
//  Created by mino on 2024/03/11.
//

import Foundation

let N = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var count = -9999
let dx = [1,-1,0,0]
let dy = [0,0,-1,1]
var maxCount = 0

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[i] = input
    for i in input {
        maxCount = max(maxCount, i)
    }
}

for k in 0...maxCount {
    var miniCount = 0
    visited = Array(repeating: Array(repeating: false, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] && map[i][j] > k {
                dfs(x: i, y: j, height: k)
                miniCount += 1
            }
        }
    }
    count = max(count, miniCount)
}
func dfs(x: Int, y: Int, height: Int) {
    visited[x][y] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= N || ny >= N || map[nx][ny] <= height || visited[nx][ny] {
            continue
        }
        
        dfs(x: nx, y: ny, height: height)
    }
}
print(count)

