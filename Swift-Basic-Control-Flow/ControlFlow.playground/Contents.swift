//: Playground - noun: a place where people can play

import Foundation

// Print from 1...10

// C-style for statement has been removed in Swift 3
// for (var i=0; i<10; i++) {
//    print(i)
// }

for i in 1...10 {
    print(i)
}

// Find the score is not qualified.
var studentScores = ["Ryan" : 45, "John" : 95, "Marry" : 50, "Vinson" : 80]

// Get each dictionary
for score in studentScores {
    if score.1 < 60 {
        print(score.0)
    }
}

// Get key and value.
for (name, score) in studentScores {
    if score < 60 {
        print(name)
    }
}

// Find gender is female
var studentGender = [
    ["name": "John", "gender" : "male"],
    ["name": "Vinson", "gender" : "male"],
    ["name": "Marry", "gender" : "female"]]

for student in studentGender {
    if student["gender"] == "female" {
        print(student["name"]!)
    }
}

