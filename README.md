<h1>Design Patterns in Swift: Interpreter</h1>
This repository is part of a series. For the full list check out <a href="https://shirazian.wordpress.com/2016/04/11/design-patterns-in-swift/">Design Patterns in Swift</a>

<h3>The problem:</h3>

Our customers at <a href="http://www.yourmechanic.com">YourMechanic</a> can request quotes through our website or through their YourMechanic App. The final price for the requested quote is a combination of two variables, the cost for parts and the cost for labor. We wish to be able to apply specific adjustments to either the parts or labor price of a quotes. These adjustments could come from coupons, warranty claims or contests. We need a simple language that can express these custom adjustments. For example we should be able to add a 20% discount for parts on a specific quote and a reduction of $10 on labor for another, or do both on the same quote.

<h3>The solution:</h3>

Link to the repo for the completed project: <a href="https://github.com/kingreza/Swift-Interpreter">Swift - Interpreter</a>
