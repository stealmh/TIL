//
//  절댓값힙11286.swift
//  Baekjoon
//
//  Created by mino on 2024/03/06.
//

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let compare: (T, T) -> Bool
    
    var isEmpty: Bool {
        return elements.count <= 1
    }
    
    var peek: T? {
        if isEmpty { return nil }
        return elements[1]
    }
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    /// insert
    mutating func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    /// pop
    mutating func pop() -> T? {
        if elements.count < 2 { return nil }
        elements.swapAt(1, elements.count - 1)
        let delete = elements.removeLast()
        drillDown(index: 1)
        return delete
    }
    /// drillDown
    mutating func drillDown(index: Int) {
        var swapIndex = index
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1
        var isSwap = false
        
        if leftIndex < elements.endIndex && compare(elements[leftIndex], elements[swapIndex]) {
            swapIndex = leftIndex
            isSwap = true
        }
        
        if rightIndex < elements.endIndex && compare(elements[rightIndex], elements[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }
        
        if isSwap {
            elements.swapAt(swapIndex, index)
            drillDown(index: swapIndex)
        }
    }
    /// swimUp
    mutating func swimUp(index: Int) {
        var index = index
        while index > 1 && compare(elements[index], elements[index / 2]) {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
}

var maxHeap = Heap<Int>(compare: >)
var minHeap = Heap<Int>(compare: <)
let N = Int(readLine()!)!

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x > 0 {
        minHeap.insert(element: x)
    } else if x < 0 {
        maxHeap.insert(element: x)
    } else {
        if minHeap.isEmpty && maxHeap.isEmpty {
            print(0)
        } else if minHeap.isEmpty {
            print(maxHeap.pop()!)
        } else if maxHeap.isEmpty {
            print(minHeap.pop()!)
        } else {
            if maxHeap.peek! * -1 <= minHeap.peek! {
                print(maxHeap.pop()!)
            } else {
                print(minHeap.pop()!)
            }
        }
    }
}
