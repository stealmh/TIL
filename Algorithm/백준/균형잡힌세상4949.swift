//
//  균형잡힌세상4949.swift
//  Baekjoon
//
//  Created by mino on 2023/12/06.
//

import Foundation

while true {
    let input = readLine()!
    var inputText: [String] = []
    if input == "." {
        break
    }
    
    for i in input {
        if i == "[" || i == "]" || i == "(" || i == ")" {
            inputText.append(String(i))
        }
        
        if inputText.count >= 2 && i == "]" && inputText[inputText.count - 2] == "[" {
            inputText.remove(at: inputText.count - 2)
            inputText.remove(at: inputText.count - 1)
        }
        
        if inputText.count >= 2 && i == ")" && inputText[inputText.count - 2] == "(" {
            inputText.remove(at: inputText.count - 2)
            inputText.remove(at: inputText.count - 1)
        }
    }
    if inputText.isEmpty {
        print("yes")
    } else {
        print("no")
    }
    inputText = []
}
