//
//  적록색약10026.swift
//  Baekjoon
//
//  Created by mino on 2024/03/11.
//

import Foundation

let N = Int(readLine()!)!

var map = Array(repeating: Array(repeating: "", count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var count: (normal: Int, `case`: Int) = (0, 0)
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for i in 0 ..< N {
    let input = readLine()!.map { String($0) }
    map[i] = input
}

for i in 0 ..< N {
    for j in 0 ..< N {
        if !visited[i][j] {
            dfs(x: i, y: j)
            count.normal += 1
        }
    }
}

for i in 0 ..< N {
    for j in 0 ..< N {
        if map[i][j] == "G" {
            map[i][j] = "R"
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0 ..< N {
    for j in 0 ..< N {
        if !visited[i][j] {
            dfs(x: i, y: j)
            count.case += 1
        }
    }
}

func dfs(x: Int, y: Int) {
    visited[x][y] = true
    let color = map[x][y]
    
    for i in 0 ..< 4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx >= N || ny >= N || visited[nx][ny] {
            continue
        }
        
        if map[nx][ny] == color && !visited[nx][ny] {
            dfs(x: nx, y: ny)
        }
        
    }
}

print("\(count.normal) \(count.case)")
