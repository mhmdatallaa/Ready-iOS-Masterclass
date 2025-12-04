import Foundation

// MARK: - Performance Comparison: Array vs Set
// Create a large Array (10,000+ elements)
// Create a Set with the same elements
// Measure time to search for an element in both
// Use CFAbsoluteTimeGetCurrent() for timing


let largeArray = Array(1...10_000)
let largeSet = Set(largeArray)
let target = 9_999

// ---- Array Search ----
var startTime = CFAbsoluteTimeGetCurrent()
let arrayContains = largeArray.contains(target)
let arrayDuration = CFAbsoluteTimeGetCurrent() - startTime
print("Array search time: \(arrayDuration) seconds, found: \(arrayContains)")


// ---- Set Search ----
startTime = CFAbsoluteTimeGetCurrent()
let setContains = largeSet.contains(target)
let setDuration = CFAbsoluteTimeGetCurrent() - startTime
print("Set search time: \(setDuration) seconds, found: \(setContains)")
