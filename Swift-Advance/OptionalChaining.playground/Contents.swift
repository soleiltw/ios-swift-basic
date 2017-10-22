//: Playground - noun: a place where people can play

// MARK: - Assignment

class Person {
    var residence : Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

// If you try to access the numberOfRooms property of this person’s residence, by placing an exclamation mark after residence to force the unwrapping of its value, you trigger a runtime error, because there is no residence value to unwrap:

// let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error

let roomCount = john.residence?.numberOfRooms

func printResidenceInfo(person: Person) {
    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
}

printResidenceInfo(person: john)
// Prints "Unable to retrieve the number of rooms."

john.residence = Residence()
printResidenceInfo(person: john)
// Prints "John's residence has 1 room(s)."

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

class PersonDetail {
    var residence : ResidenceDetail?
}

class ResidenceDetail {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    // As a shortcut to accessing its rooms array, this version of Residence provides a read-write subscript that provides access to the room at the requested index in the rooms array.
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

let howard = PersonDetail()
if let roomCount = howard.residence?.numberOfRooms {
    print("Howard residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
howard.residence?.address = someAddress

// Residence haven't created yet.
print(howard.residence)
print(howard.residence?.address)

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
howard.residence?.address = createAddress()

// The assignment is part of the optional chaining, which means none of the code on the right hand side of the = operator is evaluated. In the previous example, it’s not easy to see that someAddress is never evaluated, because accessing a constant doesn’t have any side effects. The listing below does the same assignment, but it uses a function to create the address. The function prints “Function was called” before returning a value, which lets you see whether the right hand side of the = operator was evaluated.
print(howard.residence?.address)

howard.residence?[0] = Room(name: "Bathroom")

let howardHouse = ResidenceDetail()
howardHouse.rooms.append(Room(name: "Living Room"))
howardHouse.rooms.append(Room(name: "Kitchen"))
howard.residence = howardHouse

// If you create and assign an actual Residence instance to john.residence, with one or more Room instances in its rooms array, you can use the Residence subscript to access the actual items in the rooms array through optional chaining

if let firstRoomName = howard.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."

print("Now we have \(howard.residence?.rooms.count) rooms.")

let howardAddress = Address()
howardAddress.buildingName = "The Larches"
howardAddress.street = "Laurel Street"
howard.residence?.address = howardAddress

if let howardStreet = howard.residence?.address?.street {
    print("Howard's street name is \(howardStreet).")
} else {
    print("Unable to retrieve the address.")
}

if let buildingIdentifier = howard.residence?.address?.buildingIdentifier() {
    print("Howard's building identifier is \(buildingIdentifier).")
}
// Prints "John's building identifier is The Larches."

// MARK: - Accessing Subscripts of Optional Type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
print(testScores)
