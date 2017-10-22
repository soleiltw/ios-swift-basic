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