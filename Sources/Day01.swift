//
//  File.swift
//  SwiftAOC25
//
//  Created by SJ Basak on 01/12/25.
//

import Foundation


struct Day01: AdventDay {
  var data: String
  static var day: Int { 1 }

  private var directions: [String] {
    data.split(separator: "\n")
      .map {
        String($0)
      }
  }
  
  private var puzzleSolver: PuzzleSolverDay1 {
    PuzzleSolverDay1(directions: directions)
  }

  func part1() -> Any {
    return puzzleSolver
      .part1Answer
  }

  func part2() -> Any {
    return puzzleSolver
      .part2Answer
  }
}
