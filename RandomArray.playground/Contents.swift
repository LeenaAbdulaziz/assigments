import UIKit

var arr=[Int]()

for i in 1...255{
    arr.append(i)
}

let x=Int(arc4random_uniform(UInt32(arr.count)))

let y=Int(arc4random_uniform(UInt32(arr.count)))

let temp=arr[x]
arr[x]=arr[y]
arr[y]=temp

print(arr)

for _ in 0..<100{
    let x=Int(arc4random_uniform(UInt32(arr.count)))

    let y=Int(arc4random_uniform(UInt32(arr.count)))

    let temp=arr[x]
    arr[x]=arr[y]
    arr[y]=temp
}

print(arr)

for i in 0..<arr.count{
    if arr[i]==42{
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
    }
    
}


















