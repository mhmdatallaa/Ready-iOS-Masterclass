import Foundation

// MARK: - Task 2.1: Filter Odd Numbers
// Create an array of integers (1-20)
// Use filter with a closure to keep only even numbers
// Print the result

let numbers = Array(1...20)
let evenNumbers = numbers.filter {$0 % 2 == 0}
print(evenNumbers)


// MARK: - Task 2.2: Counter Closure
// Create a closure that captures a counter variable
// Each time the closure is called, increment and return the counter
// Demonstrate calling it multiple times

var counter = 0
let increament: () -> Int = {
    counter += 1
    return counter
}
increament()
increament()
increament()

print(counter)
