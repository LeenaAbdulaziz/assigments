import UIKit

class Animal{
    var name:String
    var health=100
    
    init(name:String){
        self.name=name
    }
    
    func displayHealth(){
        print("\(name) health is: \(health)")
    }
    
    
}

class Cat:Animal{
    
    override init(name: String) {
        super.init(name: name)
        health=150
    }
    
    func growl(){
        print("Rawr!")
       
    }
    
    func run(){
        print("Running")
        health -= 10
    }
}

class Lion:Cat{
    
    override init(name: String) {
        super.init(name: name)
        health=200
    }
    
     override func growl(){
        print("ROAR!!!! I am the King of the Jungle!")
       
    }
}

class Cheetah:Cat{
    
  
    override func run(){
        
        if health >= 50{
        print("Running Fast")
            
        health -= 50
        }else{
            print("Can't run anymore")
        }
    }
    
    func Sleep(){
        
        if (health + 50) <= 200{
            health += 50
        }else{
            print("Health reached max value (200)")
        }
    }
}

let cheetah = Cheetah(name: "Cheetah")

cheetah.run()
cheetah.run()
cheetah.run()
cheetah.run()

cheetah.displayHealth()

let lion = Lion(name: "Lion")

lion.run()
lion.run()
lion.run()

lion.growl()

cheetah.Sleep()
cheetah.displayHealth()




