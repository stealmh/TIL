//
//  평범한배낭 12865.swift
//  baekjoon
//
//  Created by mino on 3/23/24.
//

import Foundation

/// n과 k를 입력받아 n,k로 분리함
let nkInput = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = nkInput[0]
let k = nkInput[1]
/// n + 1만큼의 열을 가진다. 그리고 k +1만큼의 행을 가진다.
/// -> 물품이 n개일 때 k만큼의 무게를 들 수 있는 최대의 가치
/// -> n이 만약에 3이고 k가 10이라면, 물품 3개까지 넣을 수 있으며 이때의 무게는 10보다 작거나 같다. 그때 가방의 가치
var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
/// 물품별로 가치와 무게를 입력받아 담아두기 위한 배열, 초기값이 있는 이유는 반복문을 1부터 사용하기 위함
var bag: [(weight: Int, value: Int)] = [(0, 0)]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let w = input[0]
    let v = input[1]
    
    bag.append((w, v))
}

/// 물품의 개수와 무게를 2중for문을 통해 돌린다.  문제에 나와있는 N은 100, K는 100_000 -> 10_000_000번의 계산이 들어가고 시간제한은 2초이므로 상관없음
for i in 1...n {
    for j in 1...k {
        /// 만약 현재 확인하는 물건의 무게가 현재 확인하는 무게보다 작거나 같다면 -> 가방에 넣을 수 있음이 확인됨
        if bag[i].weight <= j {
            /// i개의 물건을 k의 무게만큼 넣는 최대 값은 이전값이던가(아무것도 넣지 않았던가) j가 현재 확인하는 가방무게보다 크다는 것이 확신되므로 현재 확인하는 무게인 j에서 넣을 가방인(bag[i].weight) 무게만큼을 빼서 넣어준다. 그리고 이 값에 넣을가방의 가치를 더해줌
            dp[i][j] = max(dp[i - 1][j], bag[i].value + dp[i - 1][j - bag[i].weight])
        } else {
            /// else: 가방에 물건을 담을 수 없다면(무게초과)
            /// 아무것도 넣지 않는다. (이전값을 넣는다)
            dp[i][j] = dp[i - 1][j]
        }
    }
}
/// 정답출력: n개의 물건을 k무게로 넣었을 때의 최대가치
print(dp[n][k])

