# Session #2: Take Home Assignment

## Questions & Answers
### What does "capturing" mean in the context of closures?
**In swift, capturing means that a closure takes and stores references to variable from the surrounding context, keeping them alive even after the scope has ended.**

**Ex:**

``` swift
// Create a function that returns a closure (the closure captures the counter)
func makeCounter() -> () -> Int {
    var counter = 0   // captured variable

    let increment = {
        counter += 1
        return counter
    }

    return increment
}

// Usage
let counter = makeCounter()

print(counter())  // 1
print(counter())  // 2
print(counter())  // 3
```

-------------------
### Why use a Set instead of Array for finding common elements?, AND What are the performance implications?


 **1. Lookup performance**


•    Array: Checking if an element exists → O(n)

```swift
array.contains(x) // scans each element
```
    
•    Set: Checking if an element exists → O(1)

```swift
set.contains(x) // uses hash table
```
    
**2. Duplicate handling**

•    Set automatically removes duplicates, so common elements are unique by default.
    
•    With Arrays, you would need extra work to remove duplicates manually.

**3. Example: Intersection**

```swift
let array1 = [1, 2, 3, 4, 5]
let array2 = [3, 4, 5, 6, 7]

let commonArray = array1.filter { array2.contains($0) } // O(n*m)
let commonSet = Set(array1).intersection(array2)       // O(n + m)
```

•    filter + contains → O(n*m)

•    Set.intersection → O(n + m) → much faster for large data

**⚡ Performance Implications**

•    Using Array for lookups in loops → linear search → slow for large data

•    Using Set → hash-based lookup → near constant time

•    For large datasets, Set operations can be orders of magnitude faster
    

-------------------

### Why is Set faster for lookups?

**Set is faster for lookups because it uses a hash table:**

•    Each element is hashed to a “bucket,” so the Set can check for existence directly → O(1) time.
    
•    Array must check each element one by one → O(n) time.

-------------------

### When would you choose Array over Set despite performance?

1.    **Order matters:**
    Array preserves the order of elements; Set does not.
    
2.    **Duplicates are needed:**
    Array allows duplicates; Set automatically removes them.
    
3.    **Indexed access:**
    Array support to access elements by index; Set does not.


