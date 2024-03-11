//
//  섬의개수4963.swift
//  Baekjoon
//
//  Created by mino on 2024/03/11.
//

import Foundation

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input.reduce(0, +) == 0 { break }
    let w = input[0]
    let h = input[1]
    var map = Array(repeating: Array(repeating: 0, count: w), count: h)
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var count = 0
    let dx = [1,-1,0,0,-1,-1,1,1]
    let dy = [0,0,-1,1,-1,1,1,-1]
    var queue: [(x: Int, y: Int)] = []
    
    for i in 0..<h {
        let positionInput = readLine()!.split(separator: " ").map { Int($0)! }
        map[i] = positionInput
    }
    
    for i in 0..<h {
        for j in 0..<w {
            if !visited[i][j] && map[i][j] != 0 {
//                dfs(x: i, y: j)
                bfs(x: i, y: j)
                count += 1
            }
        }
    }
    
    print(count)
    count = 0
    
    func dfs(x: Int, y: Int) {
        visited[x][y] = true
        
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= h || ny >= w || map[nx][ny] == 0 {
                continue
            }
            
            if !visited[nx][ny] {
                dfs(x: nx, y: ny)
            }
        }
    }
    func bfs(x: Int, y: Int) {
        visited[x][y] = true
        queue.append((x, y))
        
        while !queue.isEmpty {
            let removeQueue = queue.removeLast()
            
            for i in 0..<8 {
                let nx = removeQueue.x + dx[i]
                let ny = removeQueue.y + dy[i]
                
                if nx < 0 || ny < 0 || nx >= h || ny >= w || map[nx][ny] == 0 {
                    continue
                }
                
                if !visited[nx][ny] {
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
}
