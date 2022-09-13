import UIKit

/*
 We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces, and/or dashes. It contains at least two digits.
 
 Spaces and dashes in string S can be ignored. We want to reformat the given phone number is such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.
 
 For example:
 
 S = "00-44   48 5555 8361" should become
 "004-448-555-583-61"
 
 Assume:
 - S consists only of digits (0-9), spaces, and/or dashses (-)
 - S containts at least two digits
 
 Translate:
 
 Would like to reformat a phone number string so that:
 - every third char is a "-"
 - spaces and dashes don't matter
 - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)
 
 */


func solution(_ S : String) -> String {
    // remove dashes and space
    var formattedString = S.replacingOccurrences(of: "-", with: "")
    formattedString = formattedString.replacingOccurrences(of: " ", with: "")
  
    var result = ""

    
    // track index and value of each character
    for (index, char) in formattedString.enumerated() { // O(n)
        // first append the individual character to the result
        result.append(char)
        
        let isEveryThirdCharacter = index + 1 >= 3 && (index + 1) % 3 == 0
        let isNotLastCharacter = index + 1 != S.count
        
        if  isEveryThirdCharacter && isNotLastCharacter  {
            result.append("-")
        }
    }
   
    var arr = Array(result) // O(n)
    // if second to last char is -#
    let secondLastCharIndex = arr.count - 2
    if arr[secondLastCharIndex] == "-" {
        // swap second to last and third to last chars - you can also use array.swap()
        arr[secondLastCharIndex] = arr[secondLastCharIndex - 1]
        arr[secondLastCharIndex - 1] = "-"
    }
    result = String(arr)
    // reformat to ##-##
    return result
}

solution("123456789")           // 123-456-789
solution("555372654")           // 555-372-654
solution("0 - 22 1985--324")    // 022-198-53-24

// Edge cases1
solution("01")                          // 01
solution("012")                         // 012
solution("0123")                        // 01-23
solution("0123       444")              // 012-34-44
solution("------0123       444")        // 012-34-44

// Time complexity - O(5n)-ish thus O(n)
