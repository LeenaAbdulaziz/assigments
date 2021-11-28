import UIKit

class Game{
    var players:[Player]
    var deck: Deck
    var turnIdx:Int
    var arrayCoin: [String: Int]=[:]
    
    init(players:[Player],deck: Deck,turnIdx:Int){
        self.players=players
        self.deck=deck
        self.turnIdx=turnIdx
        
        self.players.append(Player(name: "Mike", hand:deck.cards))
        self.players.append(Player(name: "Sydney", hand:deck.cards))
        self.players.append(Player(name: "Blake", hand:deck.cards))
        self.players.append(Player(name: "Tiffany", hand:deck.cards))
        deck.shuffled()
    }
    
    func playGame(){
        for i in 0...4{
            TakeTurn(play: players[i])
        }
    }
    
    func TakeTurn(play:Player){
        var count=0
        play.rollDice()
        
        for i in 0...4{
            let green=play.matchingCards(color: "Green", roll: 5)
            for _ in 0...green{
               count += 2
        }
            let blue=play.matchingCards(color: "Blue", roll: 1)
            for _ in 0...blue{
               count += 1
        }
            let red=play.matchingCards(color: "Red", roll: 4)
            for _ in 0...red{
               count += 1
        }
            play.draw(deck: self.deck)

            arrayCoin[players[i].name] = count
            
    }
}
    
    func AnnounceWinner(){
        var winner=""
        var winnercoin=0
        
        for (name,coin) in arrayCoin{
            if coin > winnercoin{
                winnercoin=coin
                winner=name
            }
            print("player name:\(name) with coins:\(coin)")
        }
        print("the winner is:\(winner) with coins:\(winnercoin)")
    }
    
}





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

var game=Game(players: [player], deck: deck, turnIdx: 2)

game.playGame()
game.TakeTurn(play: player)
game.AnnounceWinner()
