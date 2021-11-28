import UIKit

struct Card{
    var color:String
    var Roll:Int
    
}

class Deck{
    var cards:[Card]
    
    init(card: [Card]){
            
            self.cards = card
        for i in 0...2{
            for _ in 0...9{
                if i==0{
                    cards.append(Card(color: "Blue", Roll: Int.random(in: 1...2)))
                
                }else if i==1{
                    cards.append(Card(color: "Red", Roll: Int.random(in: 3...4)))
                
                }else{
                    cards.append(Card(color: "Green", Roll: Int.random(in: 4...6)))
                }
                
            }
        }
    }
    
    func Top_Most(){
        cards.removeLast()
    }
    
    func IsEmpty()->Bool{
        if (cards.count>0){
            
            return false
            
        }else{
            return true
        }
    }
    
    func shuffled(){
        cards.shuffle()
    }
    func display(){
        
        for (_,value) in cards.enumerated(){
            print("card Color:\(value.color) Roll:\(value.Roll)")
        }
    }
}

    
    class Player{
        var name:String
        var hand:[Card]
        
        init(name:String,hand:[Card]){
            self.name=name
            self.hand=hand
            
            print("Player name:\(name)")
        }
        
        func draw(deck:Deck)->Card{
            
            let d=deck.cards[Int.random(in: 1...30)]
            hand.append(d)
            return d
        }
        
        func rollDice()->Int{
            return Int.random(in: 1...6)
            
        }
        
        func matchingCards(color y:String, roll x:Int) -> Int{
            var count : Int = 0
                    for (_ , value) in hand.enumerated() {
                    if(value.color == y && value.Roll == x){
                            count = count + 1
                            
                        }
                        print(value)
                    }
                    return count
                }
        }


var card = Card(color: "Red", Roll: 5)
var deck = Deck(card: [card])

deck.display()

deck.Top_Most()

deck.shuffled()


var player = Player(name: "Lina", hand: [card])

player.draw(deck: deck)
player.draw(deck: deck)
player.draw(deck: deck)
player.draw(deck: deck)
player.draw(deck: deck)

player.rollDice()

var matchingcards=player.matchingCards(color: "Green", roll: 2)

print("Number of matching cards:\(matchingcards)")

    
    
    
    


