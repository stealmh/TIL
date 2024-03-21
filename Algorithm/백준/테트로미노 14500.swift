//
//  테트로미노 14500.swift
//  baekjoon
//
//  Created by 김민호 on 3/22/24.
//

import Foundation

let nmInput = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmInput[0]
let m = nmInput[1]

var map: [[Int]] = []
var answer = 0
for _ in 0..<n {
    let mapInput = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(mapInput)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func dfs(x: Int, y: Int, count: Int, total: Int) {
    if count == 4 {
        answer = max(answer, total)
        return
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[nx][ny] {
            let cnt = map[nx][ny]
            
            visited[nx][ny] = true
            dfs(x: nx, y: ny, count: count + 1, total: total + cnt)
            visited[nx][ny] = false
        }
    }
}

func fuckyou(x: Int, y: Int) {
    for i in 0..<4 {
        var temp = map[x][y]
        for j in 0..<3 {
            let k = (i + j) % 4
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if nx < 0 || ny < 0 || nx >= n || ny >= m {
                temp = 0
                break
            }
            
            temp += map[nx][ny]
        }
        answer = max(answer, temp)
    }
}

for i in 0..<n {
    for j in 0..<m {
        visited[i][j] = true
        dfs(x: i, y: j, count: 1, total: map[i][j])
        visited[i][j] = false
        
        fuckyou(x: i, y: j)
    }
}

print(answer)

