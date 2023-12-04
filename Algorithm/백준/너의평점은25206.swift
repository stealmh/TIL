//
//  너의평점은25206.swift
//  Baekjoon
//
//  Created by mino on 2023/12/04.
//

import Foundation

//MARK: - 나의 풀이
enum Score: String {
    case aPlus = "A+"
    case aZero = "A0"
    case bPlus = "B+"
    case bZero = "B0"
    case cPlus = "C+"
    case cZero = "C0"
    case dPlus = "D+"
    case dZero = "D0"
    case ff = "F"
    
    var detailScore: Double {
        switch self {
        case .aPlus:
            return 4.5
        case .aZero:
            return 4.0
        case .bPlus:
            return 3.5
        case .bZero:
            return 3.0
        case .cPlus:
            return 2.5
        case .cZero:
            return 2.0
        case .dPlus:
            return 1.5
        case .dZero:
            return 1.0
        case .ff:
            return 0.0
        }
    }
}

var totalGrade: Double = 0.0
var totalScore = 0.0

for _ in 0 ..< 20 {
    let input = readLine()!.split(separator: " ")
    let subjectGrade = Double(input[1])!
    let subjectScore = String(input[2])
    
    let score = Score(rawValue: subjectScore)
    
    // if let score {} 백준이 인식을 못함.. ㅡㅡ
    if let score = score {
        totalGrade += subjectGrade
        totalScore += subjectGrade * score.detailScore
    }
}
print(totalScore / totalGrade)




//MARK: - 더 나은 풀이
// 딕셔너리를 통한 풀이도 가능
