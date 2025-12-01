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

  func part1() -> Any {
    return PuzzleSolverDay1(directions: directions)
      .timesPointZero
  }

  func part2() -> Any {
    return 0 // TODO: Yet to be solved
  }
}
