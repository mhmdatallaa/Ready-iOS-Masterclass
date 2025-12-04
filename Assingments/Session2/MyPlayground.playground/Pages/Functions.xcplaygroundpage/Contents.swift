import Foundation

// MARK: - Task 1.1: Rectangle Area Calculator
// Function name: calculateRectangleArea
// Parameters: width and height (with default values)
// Return: Area as a Double
// Test with: No parameters, one parameter, both parameters

func calculateRectangleArea(width: Double = 1.0, height: Double = 1.0) -> Double {
    width * height
}

let area1 = calculateRectangleArea()  // = 1
let area2 = calculateRectangleArea(width: 3) // = 3
let area3 = calculateRectangleArea(width: 4, height: 2) // = 8


// MARK: - Task 1.2: Min/Max Finder
// Function name: findMinMax
// Parameter: Array of numbers
// Return: Tuple containing (min, max)
// Handle edge case: empty array

func findMinMax(in numbers: [Int]) -> (Int, Int) {
    let maxNumber = numbers.max() ?? 0
    let minNumber = numbers.min() ?? 0
    return (maxNumber, minNumber)
}

let numbers = [Int]()
findMinMax(in: numbers)
