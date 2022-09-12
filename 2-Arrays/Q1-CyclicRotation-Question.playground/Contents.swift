import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9
 , 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

// 3 8 9 7 6 3 8 9 7 6
// So need between indexes 2 (K - 1) and 6 ( (K -1) + Array.count - 1 (e.g. (3 -1) + 4)

func solution(A: [Int], K: Int) -> [Int] {
    // Check edges cases!!
    guard A.count > 0 else { return []}
    guard K > 0 else { return A }
    
    var result = A
    
    // Brute force it! Shift once K times
    for _ in 1...K { //)(n)
        result = shiftOnce(result) // nested loop, quadratic
    }
    return result
}

func shiftOnce(_ A: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: A.count)
   
    // shift all elements up an index except last to avoid inde out of range error
    for i in 0..<A.count - 1 { // O(n)
        result[i + 1] = A[i]
    }
    // place last element in first position
    result[0] = A.last ?? A[A.count - 1]
    return result
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2
solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]
solution(A: [3, 8, 9, 7, 6], K: -3) // [3, 8, 9, 7, 6]
solution(A: [], K: -3) // []

// Times complexity = O(N2) due to nested loop
