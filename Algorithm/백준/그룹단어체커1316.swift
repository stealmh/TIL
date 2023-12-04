//
//  그룹단어체커1316.swift
//  Baekjoon
//
//  Created by mino on 2023/12/04.
//

import Foundation

//MARK: - 나의 풀이
let wordCount = Int(readLine()!)!
var checkCount = wordCount

for _ in 0 ..< wordCount {
    let word = readLine()!
    var splitword: [String] = []
    var temp: String = ""

    for (idx, wordAlphabet) in word.enumerated() {
        if word.count >= idx + 1 {
            // 1. temp is empty
            if temp.isEmpty {
                temp += String(wordAlphabet)
            }

            // 2. 이미 값이 들어있으면서 다음단어가 들어있는 값과 다를 때
            if !temp.isEmpty && !temp.contains(wordAlphabet) {
                let stringTemp = String(temp)
                splitword.append(stringTemp)
                temp = ""
                temp += String(wordAlphabet)
            }

            if splitword.contains(temp) {
                checkCount -= 1
                break
            }
        }

    }
}

print(checkCount)
//MARK: - 더 나은 풀이
/// stack으로 쌓아서 중복되었을 때 pop해버리기
/// Set한 값의 길이와 단어의 길이가 일치하면 그룹단어

let n = Int(readLine()!)!
var groupCheckerCount = 0

func solution() -> Bool {
    let word = readLine()!
    var stack: [Character] = []
    word.forEach {
        if !stack.isEmpty && stack.last! == $0 {
            stack.removeLast()
        }
        
        stack.append($0)
    }
    
    return Set(stack).count == stack.count
}

for _ in 0 ..< n {
    if solution() {
        groupCheckerCount += 1
    }
}

print(groupCheckerCount)
