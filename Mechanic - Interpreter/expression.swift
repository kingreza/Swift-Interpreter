//
//  expression.swift
//  Mechanic - Interpreter
//
//  Created by Reza Shirazian on 2016-04-24.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

protocol Expression {
  func interpret(variables: [String:Expression]) -> Double
}
