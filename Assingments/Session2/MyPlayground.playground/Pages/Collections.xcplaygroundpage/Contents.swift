import Foundation

// MARK: - Task 3.1: Square Numbers with Map
// Create an array: [1, 2, 3, 4, 5]
// Use map to create new array with squared values
// Print both arrays

let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map {$0 * $0}
print(numbers)
print(squaredNumbers)

// MARK: - Task 3.2: Shopping Cart Total with Reduce
// Create an array of item prices (e.g., [29.99, 15.50, 8.99, 42.00] )
// Use reduce to calculate the total
// Print formatted total with currency symbol

let itemPrices = [29.99, 15.50, 8.99, 42.00]
let totalPrice = itemPrices.reduce(0, +)
print(String(format: "Total: $%.2f", totalPrice))


// MARK: - Task 4.1: Common Friends Finder
// Create two Sets representing friend groups:
// friendsGroupA: Set of names
// friendsGroupB: Set of names
// Find common friends using set operations
// Print the result

let friendsGroupA: Set<String> = ["Mohamed", "Badr", "Malak", "Ali"]
let friendsGroupB: Set<String> = ["Badr", "Ahmed", "Mohamed", "Noor"]
let commonFriends = friendsGroupA.intersection(friendsGroupB)
print(commonFriends)


// MARK: - Task 4.2: Student Grades Manager
// Create a dictionary: [String: Int] (student name: grade)
// Add at least 5 students with grades
// Update one student's grade
// Filter students with grades above 80
// Print the filtered results

var studentGrades: [String: Int] = [
    "Mohamed": 92,
    "Malak": 88,
    "Hassan": 75,
    "Sara": 95,
    "Youssef": 81
]
// Update one student's grade
studentGrades["Hassan"] = 80
// Filter students with grades above 80
let nerdStudents = studentGrades.filter { student in
    student.value > 80
}
print(nerdStudents)
