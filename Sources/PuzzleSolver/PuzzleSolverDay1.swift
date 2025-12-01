//
//  PuzzleSolverDay1.swift
//  AdventOfCode
//
//  Created by Cepheus on 02/12/25.
//


import Foundation

struct PuzzleSolverDay1 {

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