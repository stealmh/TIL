//
//  연결요소11724.swift
//  Baekjoon
//
//  Created by mino on 2023/12/11.
//

import Foundation

/// input
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 정점의 개수
let M = input[1] // 간선의 개수

var graph: [[Int]] = Array(repeating: [], count: N + 1)
var visited: [Bool] = Array(repeating: false, count: N + 1)
var count = 0


if M == 0 {
    print(N)
} else {
    for _ in 0 ..< M {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let first = input[0]
        let second = input[1]
        graph[first].append(second)
        graph[second].append(first)
    }
    
    for i in 1 ... N {
        if visited[i] == false {
            bfs(i)
            count += 1
        }
    }
    
    print(count)
}

func bfs(_ input: Int) {
    var queue: [Int] = [input]
    visited[input] = true
    
    while !queue.isEmpty {
        let q = queue.removeFirst()
        
        for i in graph[q] {
            if !visited[i] {
                visited[i] = true
                queue.append(i)
            }
        }
    }
}
