import UIKit
import Darwin

func tossCoin() ->  String{
    
        print("Tossing a Coin!")
    
    var result:String
    let random=arc4random_uniform(2)
    
    if random==0{
        result="Tails"
    }else{
        result="Heads"
    }
    print(result)
    return result
    
}



func tossMultipleCoins(time:Int) -> Double{

    var tail=0
    var head=0
    
    for _ in 1...time{
        let x = tossCoin()
        if x=="Tails"{
            tail += 1
        }else if x=="Heads"{
            head += 1
        }
        
    }
    return Double(head)/Double(time)
}
print(tossMultipleCoins(time: 4))
