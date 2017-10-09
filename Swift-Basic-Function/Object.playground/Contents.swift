//: Playground - noun: a place where people can play

import Foundation

// Object & Class
class Shape {
    var numberOfSides = 0
    var name : String
    
    init() {
        self.name = "Empty Name"
    }
    
    init(name: String, numberOfSides: Int) {
        self.name = name
        self.numberOfSides = numberOfSides
    }
    
    func simpleDescription() -> String {
        return "The shape is \(name), with \(numberOfSides) sides."
    }
}

var emptyShape = Shape()
emptyShape.name = "Triangle"
emptyShape.numberOfSides = 3
print(emptyShape.simpleDescription())

var myShape = Shape(name: "Square", numberOfSides: 4)
print(myShape.simpleDescription())

// Extend Class

class Square : Shape {
    var sideLength: Double
    
    init(sideLength:Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name, numberOfSides: 4)
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength), thus it's area is \(self.area())"
    }
}

var mySqure = Square(sideLength: 10.0, name: "My Land")
print(mySqure.simpleDescription())