//
//  main.swift
//  Mechanic - Interpreter
//
//  Created by Reza Shirazian on 2016-04-24.
//  Copyright © 2016 Reza Shirazian. All rights reserved.
//

import Foundation


var quote = Quote(partsPrice: 145.00, laborPrice: 45.00)


//adjustment: total price is only labor plus $20
quote.adjustments = "l + 20.00"
print(quote.totalPrice)

//adjustment: total price is partsPrice - $10
quote.adjustments = "p - 10.00"
print(quote.totalPrice)

//adjustment: total price is labor and part - $10
quote.adjustments = "l + p - 10.00"
print(quote.totalPrice)

//adjustment: total price is labor + 10% off parts
quote.adjustments = "l + p - p * 0.1"
print(quote.totalPrice)

//adjustment: total price is 20% off labor + 10% off parts
quote.adjustments = "l - l * 0.2 + p - p * 0.1"
print(quote.totalPrice)

//adjustment: total price is %20 off total price
quote.adjustments = "l - l * 0.2 + p - p * 0.2"
print(quote.totalPrice)

//adjustment total price is parts * labor :|
quote.adjustments = "p * l"
print(quote.totalPrice)
