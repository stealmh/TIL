//
//  로봇청소기14503.swift
//  Baekjoon
//
//  Created by mino on 2024/03/12.
//

import Foundation

/* 첫째 줄에 방의 크기 N과 M이 입력된다. (3 <= N,M <= 50) */
let nmInput = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmInput[0]
let m = nmInput[1]

/* - 둘째 줄에 처음에 로봇 청소기가 있는 칸의 좌표 (r, c)와 처음에 로봇 청소기가 바라보는 방향 d가 입력된다.
   - d가 0인 경우 북쪽, 1인 경우 동쪽, 2인 경우 남쪽, 3인 경우 서쪽을 바라보고 있는 것이다. */
let rcdInput = readLine()!.split(separator: " ").map { Int($0)! }
let r = rcdInput[0]
let c = rcdInput[1]
let d = rcdInput[2]

// 청소기의 좌표를 저장하기 위한 map
var map = [[Int]]()

// 중복된 위치를 청소하지 않기 위한 visited Array
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

/* 셋째 줄부터 N개의 줄에 각 장소의 상태를 나타내는 N X M개의 값이 한 줄에 M개씩 입력된다 */
for _ in 0 ..< n {
    let mapInput = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(mapInput)
}

// 총 청소한 칸의 개수
var cleanCount = 0

// 청소기를 반시계로 돌기 위한 dx, dy
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

// 로봇청소기의 반시계로 돈 횟수
var turnCount = 0

// 현재정보를 저장하기 위한 curR(Row), curC(Column), curD(Direction)
var curR = r
var curC = c
var curD = d

/* 처음에 빈 칸은 전부 청소되지 않은 상태이다.
    -> 시작 위치를 청소하고 방문처리를 한다. */
cleanCount += 1
visited[r][c] = true

while true {
    // 현재 방향에서 반시계로 1번 돈다.
    curD -= 1
    // 만약 -1이라면 (북쪽(0)에서 반시계(-1)로 돌아야 하므로 -1이 됨)
    // 서쪽으로 가야 하므로 dx, dy의 index 3으로 가야함.
    // row: 0 , column: -1 dx[3], dy[3]의 값은 다음과 같다. 컬럼이 -1 이동하므로 서쪽으로 이동하게 됨. 이를 쭉 반복
    if curD == -1 { curD = 3 }
    
    // 다음으로 확인해볼 좌표는 현재위치에서 바라보는 방향으로 이동했을 때!
    var nx = curR + dx[curD]
    var ny = curC + dy[curD]
    
    // 만약 해당 좌표를 방문한적 없으면서 (= 청소한 적 없거나) 해당 좌표가 벽이 아니라면 -> 청소해야 할 좌표!
    if !visited[nx][ny] && map[nx][ny] != 1 {
        // 해당 좌표를 방문처리
        visited[nx][ny] = true
        // 청소 카운트 + 1
        cleanCount += 1
        // 현재좌표위치 최신화
        curR = nx
        curC = ny
        // 청소를 했으니 로봇청소기 회전 횟수를 초기화 시켜줘도 됨
        turnCount = 0
    } else {
        // 청소해야 할 좌표가 아니라면 회전 횟수를 올려줌
        turnCount += 1
    }
    
    /* 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 없는 경우 */
    if turnCount == 4 {
        // 회전 횟수 초기화 (해당 조건문까지 왔다면 더이상 턴 할 일이 없고 새로 시작하므로 종료하기 전 초기화 작업)
        turnCount = 0
        
        // 후진했을 때의 좌표를 계산
        nx = curR - dx[curD]
        ny = curC - dy[curD]
        
        // 만약 후진할 수 있다면(해당 좌표가 벽이 아니라면 후진할 수 있는 것)
        if map[nx][ny] != 1 {
            // 해당 위치를 현재 좌표 위치로 최신화
            curR = nx
            curC = ny
        } else {
            // 뒤쪽 칸이 벽이라 후진할 수 없으므로 작동을 멈춤
            break
        }
    }
}
// 최종 청소한 횟수 출력 (= answer)
print(cleanCount)

