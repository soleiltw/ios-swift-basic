//: Playground - noun: a place where people can play

protocol Cute {
    func smile()
}

protocol Quiet {
    func sleep()
}

class Animal {
    func eat() {
        
    }
}

class Fox:Animal, Cute, Quiet {
    internal func smile() {
        print("Fox smile")
    }
    
    internal func sleep() {
        print("Fox sleep")
    }
    
    func run() {
        print("Fox run")
    }
}

class Rabbit:Animal {
    func run() {
        print("Rabbit run")
    }
}

class LittlePrince <T> where T:Quiet, T:Cute {
    var pet:T?
}

// For example
var prince = LittlePrince<Fox>()
prince.pet = Fox()
prince.pet?.smile()
prince.pet?.sleep()
