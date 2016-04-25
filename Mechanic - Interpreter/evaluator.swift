//
//  evaluator.swift
//  Mechanic - Interpreter
//
//  Created by Reza Shirazian on 2016-04-24.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation

class Evaluator: Expression {
  var syntaxTree: Expression = Number(value: 0.00)
  var expression: String

  init (expression: String) {
    self.expression = expression
  }

  private func buildSyntaxTree() {
    var expressionStack = Stack<Expression>()

    var items = expression.componentsSeparatedByString(" ")

    var index = 0

    while index < items.count {

      switch items[index] {
      case "*":
        let nextExpression = getNextExpression(items, index: index)
        expressionStack.push(Multiply(leftOperand: expressionStack.pop(),
          rightOperand: nextExpression))
        index += 2
      case "/":
        let nextExpression = getNextExpression(items, index: index)
        expressionStack.push(Divide(leftOperand: expressionStack.pop(),
          rightOperand: nextExpression))
        index += 2
      case "+":
        let nextExpression = getNextExpression(items, index: index)
        expressionStack.push(Add(leftOperand: expressionStack.pop(),
          rightOperand: nextExpression))
        index += 2

      case "-":
        let nextExpression = getNextExpression(items, index: index)
        expressionStack.push(Subtract(leftOperand: expressionStack.pop(),
          rightOperand: nextExpression))
        index += 2

      default:
        if let doubleValue = items[index].doubleValue {
          expressionStack.push(Number(value: doubleValue))
          index += 1
        } else {
          expressionStack.push(Variable(name: items[index]))
          index += 1
        }
      }

    }
    syntaxTree = expressionStack.pop()
  }

  private func getNextExpression(items: [String], index: Int) -> Expression {
    let next = items[index + 1]
    var nextExpression: Expression
    if let doubleValue = next.doubleValue {
      nextExpression = Number(value: doubleValue)
    } else {
      nextExpression = Variable(name: next)
    }
    return nextExpression
  }

  private func parseoutAdditionsAndSubtractions(input: String) -> [String] {
    var result = [String]()

    let items = input.componentsSeparatedByString(" ")

    var sentence = ""
    var index = 0
    for item in items {
      if item == "+" || item == "-" {
        result.append(sentence.trim())
        result.append(item)
        sentence = ""
      } else {
        sentence += item
        if index != items.count - 1 {
          sentence += " "
        }
      }
      index += 1
    }
    result.append(sentence)
    return result
  }

  func interpret(variables: [String : Expression]) -> Double {
    let expressions = parseoutAdditionsAndSubtractions(expression)

    if (expression.contains("/") || expression.contains("*")) &&
       (expression.contains("+") || expression.contains("-")) {

      var newExpression = ""
      var index = 0
      for expression in expressions {
        if expression == "+" || expression == "-" {
          newExpression += expression
        } else {
          let eval = Evaluator(expression: expression)
          let result = eval.interpret(variables)
          newExpression += String(result)
        }

        if index != expressions.count - 1 {
          newExpression += " "
        }
        index += 1
      }
      let evaluator = Evaluator(expression: newExpression)
      return evaluator.interpret(variables)
    } else {
      buildSyntaxTree()
      return syntaxTree.interpret(variables)
    }
  }
}
