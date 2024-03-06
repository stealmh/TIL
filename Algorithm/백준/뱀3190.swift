//
//  main.swift
//  baekjoon
//
//  Created by 김민호 on 3/5/24.
//

import Foundation

/// n * n 맵의 크기
let n = Int(readLine()!)!
/// 사과의 개수
let k = Int(readLine()!)!
/// 맵 생성
/// - S: 뱀의 머리
/// - A: 사과
/// - .: 빈칸
var map = Array(repeating: Array(repeating: ".", count: n), count: n)
/// 뱀의 좌표를 담을 변수
var snake = [(x: Int, y: Int)]()
/// 초기의 뱀의 좌표를 추가
snake.append((0,0))
/// 맵의 좌측 상단에 뱀의 머리를 추가
map[0][0] = "S"

for _ in 0 ..< k {
    let apple = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let x = apple[0]
    let y = apple[1]
    map[x][y] = "A"
}

///시계방향으로 돌 위치 배열
let dx = [0,1,0, -1]
let dy = [1,0,-1,0]
/// 처음에 뱀은 오른쪽으로 시작하니까 dir의 초기값은 0, dx[dir] 과dy[dir]의 값인 오른쪽으로 돌음
var dir = 0

let l = Int(readLine()!)!
var directions = Array(repeating: " ", count: 10001)
for _ in 0 ..< l {
    let line = readLine()!.split(separator: " ").map { String($0) }
    /// n초때 행동해야할 것
    let x = Int(line[0])!
    /// 방향
    let c = line[1]
    directions[x] = c
}

var time = 0

while true {
    time += 1
    
    let head = snake.first!
    let nx = head.x + dx[dir]
    let ny = head.y + dy[dir]
    
    /// 탈출조건: 벽에 부딧히거나 몸에 부딧혔을 때
    if nx >= n || ny >= n || nx < 0 || ny < 0 || map[nx][ny] == "S" {
        break
    }
    /// 뱀의 좌표 넣어주기
    snake.insert((nx, ny), at: 0)
    /// 빈칸이라면? -> 사과가 없으니까 꼬리를 잘라야 함
    if map[nx][ny] == "." {
        /// 1. 꼬리짜르기
        let tail = snake.removeLast()
        /// 2. 꼬리위치를 원상복구 (빈칸으로)
        map[tail.x][tail.y] = "."
    }
    /// 사과를 먹거나 꼬리를 짤렸을 때 한칸이동
    map[nx][ny] = "S"
    
    if directions[time] == "L" {
        dir -= 1
        if dir == -1 {
            dir = 3
        }
    } else if directions[time] == "D" {
        dir += 1
        if dir == 4 {
            dir = 0
        }
    }
}
print(time)
