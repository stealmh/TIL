//
//  미로탐색 2178.swift
//  Baekjoon
//
//  Created by mino on 2023/12/11.
//

import Foundation

/// input
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
let M = input[1]

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

var graph: [[Int]] = []

for _ in 0..<N {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

func bfs() {
    var queue = [(0,0)]

    while !queue.isEmpty {
        let (x,y) = queue.removeFirst()

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if !(nx < 0 || nx >= N || ny < 0 || ny >= M) {
                if graph[nx][ny] == 1 {
                    graph[nx][ny] = graph[x][y] + 1
                    queue.append((nx,ny))
                }
            }
        }
    }
}
bfs()
print(graph[N-1][M-1])
