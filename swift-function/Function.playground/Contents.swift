//: Playground - noun: a place where people can play

import Foundation

// A basic function, no parameter, no return.
func greetOnlyHi() {
    print("Hi")
}

greetOnlyHi()

// A function with return value
func greatOnly() -> String {
    return "Hello"
}

var hello = greatOnly()
print(hello)

// A function with input parameter, and return result
func greet(to name:String) -> String {
    return "Hello! \(name)"
}

var helloJohn = greet(to: "John")
print(helloJohn)

// A function with muliple parameters.
func greet(to name:String, company:String) -> String {
    return "Hello! \(name) from \(company)"
}

print(greet(to: "Edward", company: "Soleil Studio"))

// A function with muliple return value
func getGasPrices() -> (nintyTwo: UInt32, nintyFive: UInt32, nintySeven: UInt32) {
    return (arc4random()%3 + 28, arc4random()%3 + 30, arc4random()%3 + 32)
}

print("92 price: \(getGasPrices().nintyTwo)")
print("95 price: \(getGasPrices().nintyFive)")
print("97 price: \(getGasPrices().nintySeven)")

func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for eachNumber in numbers {
        sum += eachNumber
    }
    return sum
}

print("Sum result is \(sumOf(numbers: 1, 2, 3, 5))")
