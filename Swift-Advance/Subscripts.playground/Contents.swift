//: Playground - noun: a place where people can play

// Here’s an example of a read-only subscript implementation, which defines a TimesTable structure to represent an n-times-table of integers

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18"

// https://medium.com/@abhimuralidharan/subscripts-in-swift-51e73cc5ddb5
class Daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}
var daysOfWeek = Daysofaweek()
print(daysOfWeek[0]) // prints sunday
daysOfWeek[0] = "Monday"
print(daysOfWeek[0]) // prints Monday


struct subexample {
    let decrementer: Int
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}
let division = subexample(decrementer: 100)

print("The number is divisible by \(division[9]) times")
print("The number is divisible by \(division[2]) times")
