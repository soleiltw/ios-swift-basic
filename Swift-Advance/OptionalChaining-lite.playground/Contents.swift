//: Playground - noun: a place where people can play

class Person {
    var residence : Residence?
}

class Residence {
    var numberOfRooms = 1
    var address: Address?
}

class Address {
    var street : String?
    func printStreetName() -> String? {
        if street != nil {
            return "Current street name is: \(street!)"
        } else {
            return nil
        }
    }
}

let john = Person()
print("John residence info: \(john.residence?.numberOfRooms)")

func printResidenceInfo(person: Person) {
    if let roomCount = person.residence?.numberOfRooms {
        print("Current person residence info: \(roomCount)")
    } else {
        print("Unable to retrieve any numbers of room.")
    }
}

printResidenceInfo(person: john)

let residence = Residence()
residence.numberOfRooms = 3
john.residence = residence
printResidenceInfo(person: john)

let howard = Person()

let howardResidence = Residence()
let howardLivingAddress = Address()
howardLivingAddress.street = "英專路"
howardResidence.address = howardLivingAddress

howard.residence = howardResidence

if let address = howard.residence?.address {
    print("Howard \(address.printStreetName()!)")
} else {
    print("Unable to find address.")
}
