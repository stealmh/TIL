//
//  숨바꼭질1697.swift
//  Baekjoon
//
//  Created by mino on 2023/12/11.
//

import Foundation

/// input
let input = readLine()!.split(separator: " ").map { Int($0)! }
let subinPosition = input[0]
let brotherPosition = input[1]
var bigger = max(subinPosition, brotherPosition)
let move = [-1,1]
var graph = Array(repeating: 0, count: 100000 + 1)
var visited = Array(repeating: false, count: 100000 + 1)

func bfs() {
    var queue: [Int] = [subinPosition]
    graph[subinPosition] = 1
    visited[subinPosition] = true
    
    while !queue.isEmpty {
        let q = queue.removeFirst()
        
        for i in 0..<2 {
            let nx = q + move[i]
            let nx2 = q * 2
            if !(nx < 0 || nx > 100000) {
                if graph[nx] == 0 && !visited[nx] {
                    graph[nx] = graph[q] + 1
                    visited[nx] = true
                    queue.append(nx)
                }
            }
            
            if !(nx2 < 0 || nx2 > 100000) {
                if graph[nx2] == 0 && !visited[nx2] {
                    graph[nx2] = graph[q] + 1
                    visited[nx2] = true
                    queue.append(nx2)
                }
            }
        }
        
    }
}
bfs()
print(graph[brotherPosition] - 1)
