//
//  DFS와 BFS 1260.swift
//  Baekjoon
//
//  Created by mino on 2023/12/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0],
    m = input[1],
    startNumber = input[2]

var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited: [Int] = Array(repeating: 0, count: n + 1)

var dfsArray: [Int] = []
var bfsArray: [Int] = []

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]
    graph[start].append(end)
    graph[end].append(start)
    graph[start].sort()
    graph[end].sort()
}

func dfs(_ input: Int) {
    if visited[input] == 0 {
        visited[input] = 1
        dfsArray.append(input)
    } else {
        return
    }

    for i in graph[input] {
        dfs(i)
    }
}

func bfs(_ input: Int) {
    var queue = [input]
    var index = 0
    visited[input] = 1
    
    while !queue.isEmpty {
        let q = queue.remove(at: 0)
        bfsArray.append(q)
        for i in graph[q] {
            if visited[i] == 0 {
                queue.append(i)
                visited[i] = 1
            }
        }
    }
}

dfs(startNumber)
visited = Array(repeating: 0, count: n + 1)
bfs(startNumber)

print(dfsArray.map { String($0) }.joined(separator: " "))
print(bfsArray.map { String($0) }.joined(separator: " "))
