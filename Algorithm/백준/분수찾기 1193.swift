//
//  분수찾기 1193.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

var input = Int(readLine()!)!

var line = 0 // 몇번째라인인지
var maxValue = 0 // 해당 라인에 몇개까지 숫자가 들어가는지 확인용


while input > maxValue { /// 입력받은 값이 몇번째 라인인지 체크함. 7이 들어온다면 1+2+3+4 즉 4일 때 7을 넘으니까 line은 4가 되고, maxValue에는 누적값인 10이 들어간다.
    line += 1
    maxValue += line
}

let order = maxValue - input /// order는 최대 들어가는 개수에서 입력값을 뺀다. 빼는 이유는 인덱스의 값을 알기 위함. 예를 들어 3이 나왔으면 무조건 아래에서부터 3번째 칸에 있는 값이 해당된다.


if line % 2 == 0 { /// 아래에서부터 order까지 하나씩 체크를 진행한다.
                   /// 분자는 1씩 줄어들고 분모는 1씩 늘어난다.
                   /// 홀수의 경우에는 반대로 진행한다. 맨위에 있는 숫자가 order가 0이다. 즉 진행할수록 분자가 커지고 분모가 작아지게 만들어야한다.
    print("\(line - order)/\(order + 1)")
} else {
    print("\(order + 1)/\(line - order)")
}
