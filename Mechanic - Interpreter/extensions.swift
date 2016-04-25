//
//  extensions.swift
//  Mechanic - Interpreter
//
//  Created by Reza Shirazian on 2016-04-24.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

extension String {
  struct NumberFormatter {
    static let instance = NSNumberFormatter()
  }

  var doubleValue: Double? {
    return NumberFormatter.instance.numberFromString(self)?.doubleValue
  }

  var integerValue: Int? {
    return NumberFormatter.instance.numberFromString(self)?.integerValue
  }

  func contains(find: String) -> Bool {
    return self.rangeOfString(find) != nil
  }

  func trim() -> String {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
  }
}
