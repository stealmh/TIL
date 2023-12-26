//
//  RGB거리 1149.swift
//  Baekjoon
//
//  Created by mino on 2023/12/26.
//

import Foundation

/* 조건
 1. 1 번집의 색 != 2 번집의 색
 2. N 번집의 색 != N-1 번집의 색
 3. i 번째집의 색 != i-1 번집의 색
 4. i. 번째집의 색 != i+1 번집의 색
 
 */

/// 1. 집의 수를 입력받는다.
let N = Int(readLine()!)!
/// 2. 집의 수만큼 거리를 넣을 배열을 하나 생성
var rgbArray = [[Int]](repeating: [Int](repeating: 0, count: 1), count: N)


for i in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    /// 3. i번째에 해당하는 거리를 배열에 저장
    rgbArray[i] = input
}


for i in 1..<N {
    /// 4. i번째의 해당하는 값은 이전값의 최소치와 현재 값을 더한 값을 할당함
    rgbArray[i][0] = min(rgbArray[i-1][1], rgbArray[i-1][2]) + rgbArray[i][0]
    rgbArray[i][1] = min(rgbArray[i-1][0], rgbArray[i-1][2]) + rgbArray[i][1]
    rgbArray[i][2] = min(rgbArray[i-1][0], rgbArray[i-1][1]) + rgbArray[i][2]
}

print(min(rgbArray[N-1][0], rgbArray[N-1][1], rgbArray[N-1][2]))
