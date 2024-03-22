//
//  퇴사 14501.swift
//  baekjoon
//
//  Created by mino on 3/23/24.
//

import Foundation

/// n개의 일정 스케쥴
let n = Int(readLine()!)!
/// n개의 스케쥴을 입력받을 배열 생성, 첫번째 값은 걸리는 날짜, 두번째 값은 성공시 수당
var schedule: [(day: Int, pay: Int)] = []

for _ in 0..<n {
    /// 개별 스케쥴 입력 (반복문을 통해 n번 입력 받음)
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let day = input[0]
    let pay = input[1]
    
    schedule.append((day, pay))
    
}
/// 최대수당을 입력하기 위한 배열
var dp = Array(repeating: 0, count: n + 1)
/// Top Down 방식을 이용해서 해답을 구한다!
/// - from: n이 포함됨, n - 1을 넣은 이유는 밑에서 진행 할 dp[idx + 1]의 값을 구할 때 index 범위가 초과하기 때문에 넣어줌
/// - to: 매개변수 값이 포함이 안됨, -> -1까지니 0까지 돌꺼임 즉 0번째에 해당하는 값의 dp 배열에 최종적으로 받을 최대 금액을 적는다!
/// - by: 반복문을 돌며 -1씩 깎음
for idx in stride(from: n - 1, to: -1, by: -1) {
    /// 만약 idx 값과(idx번째 되는 날) 스케쥴을 해야할 날을 더했을 떄 그 값이 퇴사날 이후라면? -> 진행하지 못함
    if idx + schedule[idx].day > n {
        /// 상담을 진행하지 못하기 때문에 (퇴사날까지 상담이 잡혀있음) 이전 값을 그대로 전달해준다!
        dp[idx] = dp[idx + 1]
    } else {
        /// else: 상담을 할 수 있음
        /// idx번째 되는 날에 해당되는 값은 이전에 상담한 값이거나(상담을 안하고 전 값만 받아옴) -> dp[idx + 1]
        /// 상담을 했거나 (현재날짜인 idx + 상담까지 걸리는 시간 + 그에 따른 보수)
        /// 둘중 큰 값을 넣어줌!
        dp[idx] = max(dp[idx + 1], dp[idx + schedule[idx].day] + schedule[idx].pay)
    }
}
/// 최종적으로 구하고자 하는 값은 dp[0]번에 저장되어 있음. 이 값이 퇴사하기 전 받을 수 있는 최대 보수
print(dp[0])

