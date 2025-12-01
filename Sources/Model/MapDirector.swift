//
//  MapDirector.swift
//  AdventOfCode
//
//  Created by Cepheus on 02/12/25.
//

import Foundation

enum MapDirector {
  case left(Int)
  case right(Int)

  var steps: Int {
    switch self {
    case .left(let value), .right(let value): return value
    }
  }
  static func fromString(_ string: String) -> MapDirector? {
    if string.first == "R" {
      .right(Int(string.dropFirst())!)
    } else if string.first == "L" {
      .left(Int(string.dropFirst())!)
    } else {
      nil
    }
  }
}

extension Array where Element == MapDirector {
  var timesPointZero: Int {
    let mapDirection: Node<Int> = {
      let node = Node(value: 0)
      (1...99)
        .forEach { value in
          node.addNext(with: value)
        }
      
      return node
        .generateCircularLL()
    }()
    
    var result = 0
    var currentPoint = mapDirection.getNode(with: 50, cancelOnValue: mapDirection.value
    ) ?? mapDirection
    print(currentPoint.value)
    self
      .forEach { director in
        let newPoint = switch director {
          case .left(let value):
            currentPoint.previousNode(by: value)
          case .right(let value):
            currentPoint.nextNode(by: value)
        }
        if let newPoint {
          currentPoint = newPoint
          
//          print(director)
//          print(newPoint.value)
          
          if currentPoint.value == 0 { result += 1}
        }
      }
    
    
    return result
  }
}
