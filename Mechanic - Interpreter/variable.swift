//
//  variable.swift
//  Mechanic - Interpreter
//
//  Created by Reza Shirazian on 2016-04-24.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation


class Variable: Expression {
  private var name: String

  init(name: String) {
    self.name = name
  }

  func interpret(variables: [String : Expression]) -> Double {
    if let expression = variables[name] {
      return expression.interpret(variables)
    } else {
      return 0.00
    }
  }
}
