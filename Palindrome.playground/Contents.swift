import UIKit

func isPalindrome1(_ value: String) -> Bool
{
    let len = value.count / 2

    for i in 0..<len
    {
        let start = value.index(value.startIndex, offsetBy: i)
        let end = value.index(value.endIndex, offsetBy: (i * -1) - 1)
        
        if value[start] != value[end] {
            return false
        }
    }
    return true
}

print(isPalindrome1("true"))

//------------------------------------------------//

func isPalindrome2( _ value: String) -> Bool
{
    guard value.count >= 2 else {
        return true
    }

    let end = value.index(value.endIndex, offsetBy: -1)

    if value[value.startIndex] == value[end] {
        let start = value.index(value.startIndex, offsetBy: 1)
        return isPalindrome2(String(value[start..<end]))
    } else {
        return false
    }
}
print(isPalindrome2("madam"))

let name: String?=nil
print(name )


