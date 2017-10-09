//: Playground - noun: a place where people can play

enum CompassPoint {
    case north
    case south
    case east
    case west
}

// Multiple cases can appear on a single line, separated by commas:

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead : CompassPoint = CompassPoint.west
directionToHead = .east

// Matching Enumeration Values with a Switch Statement
// You can match individual enumeration values with a switch statement:

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"

// When it is not appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that are not addressed explicitly

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// MARK: - Associated Values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

// If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// Raw Values

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum PlanetValue: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPointValue: String {
    case north, south, east, west
}

let earthsOrder = PlanetValue.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPointValue.west.rawValue
// sunsetDirection is "west"

let positionToFind = 11
if let somePlanet = PlanetValue(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"

