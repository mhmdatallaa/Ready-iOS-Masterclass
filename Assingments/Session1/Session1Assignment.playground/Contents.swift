import Foundation

// MARK: - Task 1: Basic Calculator Logic

enum MathematicalOperation: String {
    case sum = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    
    func perform(_ a: Double, _ b: Double) -> Double? {
            switch self {
            case .sum: a + b
            case .subtraction: a - b
            case .multiplication: a * b
            case .division:  b == 0 ? nil : a / b
            }
        }
}


func performOperation(_ number1: Double, number2: Double, operation: MathematicalOperation) {
    if let result = operation.perform(number1, number2) {
        print(number1, operation.rawValue, number2, "= \(result)" )
    } else {
        print("Error: Division by zero is not allowed.")
    }
}


performOperation(5, number2: 6, operation: .multiplication)
performOperation(3, number2: 0, operation: .division)
print("================================")

// MARK: - Task 2: Student Grade Analyzer

let scores = [85, 92, 78, 65, 95, 70]

// Dictionary: student name → score
let students: [String: Int] = [
    "Ali": 85,
    "Sara": 92,
    "Omar": 78,
    "Mona": 65,
    "Zahra": 95,
    "Youssef": 70
]

// Calculate average score using a for-in loop
var total = 0
for score in scores {
    total += score
}
let average = total / scores.count

//let average = scores.reduce(0, +) / scores.count
print("Average score: \(average)")

// Iterate through dictionary and print each student's name + score
for (name, score) in students {
    print("\(name): \(score)")
}

// Function that returns a grade based on score
func grade(for score: Int) -> String {
    switch score {
    case 90...100: "A"
    case 80...90: "B"
    case 70...80: "C"
    case 60...70: "D"
    default: "F"
    }
}


print("Grade for 92:", grade(for: 92))
print("Grade for 65:", grade(for: 65))


// Optional binding when accessing values from dictionary
func printStudentScore(_ name: String) {
    if let score = students[name] {
        print("\(name)'s score is \(score) and their grade is \(grade(for: score))")
    } else {
        print("Student '\(name)' not found.")
    }
}

printStudentScore("Sara")
printStudentScore("Unknown")
