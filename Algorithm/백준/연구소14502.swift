//
//  연구소14502.swift
//  Baekjoon
//
//  Created by mino on 2024/03/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var map = [[Int]]()
var result = 0

for _ in 0..<n {
    let mapInput = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(mapInput)
}

func wall(depth: Int) {
    if depth == 3 {
        // bfs
        bfs()
        return
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 0 {
                map[i][j] = 1
                wall(depth: depth + 1)
                map[i][j] = 0
            }
        }
    }
}

func bfs() {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var copyMap = map
    var queue: [(row: Int, col: Int)] = []
    
    for i in 0..<n {
        for j in 0..<m {
            if copyMap[i][j] == 2 {
                queue.append((i,j))
            }
        }
    }
    
    while !queue.isEmpty {
        let dx = [1,-1,0,0]
        let dy = [0,0,1,-1]
        
        let q = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = q.row + dx[i]
            let ny = q.col + dy[i]
            
            if nx >= 0 && ny >= 0 && nx < n && ny < m {
                if !visited[nx][ny] && copyMap[nx][ny] == 0 {
                    visited[nx][ny] = true
                    copyMap[nx][ny] = 2
                    queue.append((nx, ny))
                    
                }
            }
        }
    }
    var zeroCount = 0
    for i in 0..<n {
        for j in 0..<m {
            if copyMap[i][j] == 0 {
                zeroCount += 1
            }
        }
    }
    result = max(result, zeroCount)
}

wall(depth: 0)
print(result)

