//
//  File.swift
//  SwiftAOC25
//
//  Created by SJ Basak on 01/12/25.
//

import Foundation


let input: [String] = [
    "L68",
    "L30",
    "R48",
    "L5",
    "R60",
    "L55",
    "L1",
    "L99",
    "R14",
    "L82"
]
let allDirection: [Int] = Array(0...99)

enum MapDirector {
    case left(Int)
    case right(Int)
    
    var steps: Int {
        switch self {
            case .left(let value): return -(value-1)
            case .right(let value): return value-1
        }
    }
    static func fromString(_ string: String) -> MapDirector? {
        if string.first == "R" {
            .right(Int(string.dropFirst())!)
        } else if string.first == "L" {
            .left(Int(string.dropFirst())!)
        } else { nil }
    }
}

extension Array where Element == MapDirector {
    var timesPointZero: Int {
        var result = 0
        var coveredSteps: Int = 50 /// As dial starts from here
        
        self
            .forEach { director in
                let steps = (coveredSteps + director.steps)
                let upcomingStep = steps < 0 ? (allDirection.count-1) + steps : steps
                
                let followingStep = (upcomingStep) % (allDirection.count-1)
                
                coveredSteps = followingStep
                
              // TODO: Some problem
//                let pointingLocation = allDirection[
//                    coveredSteps
//                ]
               
                print(followingStep)
//                if pointingLocation == 0 { result += 1 }
            }
        
        return result
    }
}

struct PuzzleSolver {
    
    let directions: [String]
    
    init(directions: [String]) {
        self.directions = directions
    }
    
    var director: [MapDirector] {
        var director: [MapDirector] = []
        directions
            .forEach { direction in
                if let mapDirector = MapDirector.fromString(direction) {
                    director
                        .append(mapDirector)
                }
            }
        return director
    }
    var timesPointZero: Int {
        director
            .timesPointZero
    }
}


let solver = PuzzleSolver(directions: input)

print(
    solver
        .timesPointZero
)



/// LinkedList
class Node<Model: Equatable> {
    var id = UUID()
    
    let value: Model
    var next: Node?
    
    init(value: Model, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    func lastNode() -> Node {
        guard let node = self.next else {
            return self
        }
        
        return node.lastNode()
    }
}

var circularMap: Node = Node(value: 0)
Array(1...99)
    .forEach { value in
        let newNode = Node(value: value)
        
        circularMap.lastNode().next = newNode
    }

print(circularMap.lastNode().value)
