//
//  달팽이는올라가고싶다 2869.swift
//  Baekjoon
//
//  Created by mino on 2023/12/13.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let A = input[0]
let B = input[1]
let V = input[2]
let lastCheck = ((V - B) % (A - B)) >= 1 ? 1 : 0
print(((V - B) / (A - B)) + lastCheck)
