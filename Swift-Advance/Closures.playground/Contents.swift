//: Playground - noun: a place where people can play

// This example is sorting an array of String values, and so the sorting closure needs to be a function of type (String, String) -> Bool.

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(s1:String, s2:String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)

// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// If the first string (s1) is greater than the second string (s2), the backward(_:_:) function will return true, indicating that s1 should appear before s2 in the sorted array. For characters in strings, “greater than” means “appears later in the alphabet than”. This means that the letter "B" is “greater than” the letter "A", and the string "Tom" is greater than the string "Tim". This gives a reverse alphabetical sort, with "Barry" being placed before "Alex", and so on.

// MARK: - Closure Expression Syntax

reversedNames = names.sorted(by: { (s1, s2) -> Bool in
    return s1 > s2
})

// The start of the closure’s body is introduced by the in keyword. This keyword indicates that the definition of the closure’s parameters and return type has finished, and the body of the closure is about to begin.

// MARK: -  Implicit Returns from Single-Expression Closures

reversedNames = names.sorted(by: { s1, s2 in s1 > s2})
print(reversedNames)

// MARK: - Shorthand Argument Names

// Swift automatically provides shorthand argument names to inline closures, which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.

reversedNames = names.sorted(by: {$0 > $1})
print(reversedNames)

// MARK: - Operator Methods

// There’s actually an even shorter way to write the closure expression above. Swift’s String type defines its string-specific implementation of the greater-than operator (>) as a method that has two parameters of type String, and returns a value of type Bool. This exactly matches the method type needed by the sorted(by:) method. Therefore, you can simply pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation

reversedNames = names.sorted(by: >)
print(reversedNames)

// Here’s how you can use the map(_:) method with a trailing closure to convert an array of Int values into an array of String values. The array [16, 58, 510] is used to create the new array ["OneSix", "FiveEight", "FiveOneZero"]:

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output : String = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]
print(strings)

// Here’s an example of a function called makeIncrementer, which contains a nested function called incrementer. The nested incrementer() function captures two values, runningTotal and amount, from its surrounding context. After capturing these values, incrementer is returned by makeIncrementer as a closure that increments runningTotal by amount each time it is called.

// The return type of makeIncrementer is () -> Int. This means that it returns a function, rather than a simple value. The function it returns has no parameters, and returns an Int value each time it is called.

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()

// An autoclosure lets you delay evaluation, because the code inside isn’t run until you call the closure. Delaying evaluation is useful for code that has side effects or is computationally expensive, because it lets you control when that code is evaluated. The code below shows how a closure delays evaluation.

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = {
    customersInLine.remove(at: 0)
}
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

