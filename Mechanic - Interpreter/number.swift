//
//  number.swift
//  Mechanic - Interpreter
//
//  Created by Reza Shirazian on 2016-04-24.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

class Number: Expression {
  var value: Double

  init(value: Double) {
    self.value = value
  }

  func interpret(variables: [String : Expression]) -> Double {
    return value
  }
}
