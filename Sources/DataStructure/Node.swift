//
//  Node.swift
//  AdventOfCode
//
//  Created by Cepheus on 02/12/25.
//

import Foundation

/// LinkedList
class Node<Model: Equatable> {
  var id = UUID()

  let value: Model
  var previous: Node?
  var next: Node?

  init(value: Model, previous: Node? = nil, next: Node? = nil) {
    self.value = value
    self.previous = previous
    self.next = next
  }

  func lastNode() -> Node {
    guard let node = self.next else {
      return self
    }

    return node.lastNode()
  }

  func getNode(with value: Model, cancelOnValue: Model) -> Node? {
    if self.value == value { return self }
    if self.next?.value == cancelOnValue {
      return nil
    }

    return self.next?.getNode(with: value, cancelOnValue: cancelOnValue)
  }

  func nextNode(by steps: Int, tracked: inout Int, trackingValue: Model) -> Node? {
    guard steps > 0 else { return nil }
    var node = self
    for _ in 0..<steps {
      if node.value == trackingValue { tracked += 1 }
      if let newNode = node.next {
        node = newNode
      }
    }

    return node
  }
  func nextNode(by steps: Int) -> Node? {
    guard steps > 0 else { return nil }
    var node = self
    for _ in 0..<steps {
      if let newNode = node.next {
        node = newNode
      }
    }

    return node
  }
  
  func previousNode(by steps: Int, tracked: inout Int, trackingValue: Model) -> Node? {
    guard steps > 0 else { return nil }
    var node = self
    for _ in 0..<steps {
      if node.value == trackingValue { tracked += 1 }
      if let newNode = node.previous {
        node = newNode
      }
    }

    return node
  }
  func previousNode(by steps: Int) -> Node? {
    guard steps > 0 else { return nil }
    var node = self
    for _ in 0..<steps {
      if let newNode = node.previous {
        node = newNode
      }
    }

    return node
  }

  func addNext(with value: Model) {
    let newNode = Node(value: value, previous: self.lastNode(), next: nil)
    self.lastNode().next = newNode
  }
  func generateCircularLL() -> Node {
    let freshNode = self
    let lastNode = freshNode.lastNode()
    freshNode.previous = lastNode
    lastNode.next = freshNode

    return freshNode
  }
}

extension Node where Model == Int {
  static var mapDirection: Node<Int> {
    let node = Node(value: 0)
    (1...99)
      .forEach { value in
        node.addNext(with: value)
      }
    
    return node
      .generateCircularLL()
  }
}
