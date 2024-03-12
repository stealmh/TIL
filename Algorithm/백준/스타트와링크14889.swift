//
//  스타트와링크14889.swift
//  Baekjoon
//
//  Created by mino on 2024/03/12.
//

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]]()
var visited = Array(repeating: false, count: n)
var minValue = Int.max

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

func back(depth: Int, idx: Int) {
    if depth == n / 2 {
        var power1 = 0,
            power2 = 0
        
        for i in 0..<n {
            for j in 0..<n {
                if visited[i] && visited[j] {
                    power1 += graph[i][j]
                } else if !visited[i] && !visited[j] {
                    power2 += graph[i][j]
                }
            }
        }
        
        minValue = min(minValue, abs(power1 - power2))
        return
    }
    
    for i in idx..<n {
        if !visited[i] {
            visited[i] = true
            back(depth: depth + 1, idx: i)
            visited[i] = false
        }
    }
}


back(depth: 0, idx: 0)
print(minValue)
