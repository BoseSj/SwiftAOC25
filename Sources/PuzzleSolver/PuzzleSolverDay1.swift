//
//  PuzzleSolverDay1.swift
//  AdventOfCode
//
//  Created by Cepheus on 02/12/25.
//


import Foundation


protocol PuzzleSolver {
  associatedtype Model = Equatable
  
  var part1Answer: Model { get }
  var part2Answer: Model { get }
}

struct PuzzleSolverDay1: PuzzleSolver {
  
  private let directions: [String]

  init(directions: [String]) {
    self.directions = directions
  }

  private var director: [MapDirector] {
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

  
  var part1Answer: Int {
    director
      .timesReachedToZero
  }
  var part2Answer: Int {
    director
      .timesPointingToZero
  }
}
