import UIKit

class Person {
  let species = "H. Sapiens"
    var name:String
    
    init(name:String){
        self.name=name
        
    }
    
    func speak() {
        print("Hello! I am a \(self.species)")   // Note how we refer to the properties of the instance through "self"
      }
}


var myPerson = Person(name: "Lina")                 // Note use of type inference to infer that it is "Person" type
//myPerson.species = "Homo Sapiens"       // We can change the property
print(myPerson.species)          // And we can access it!
myPerson.speak()


//--------------------------------//

struct Rectangle {
  var width = 10
  var height = 20
  func printDesc() {
    print("I have a width of \(width) and a height of \(height)")
  }
  mutating func doubleWidth() {                // Why do we need the mutating keyword here?
    width *= 2
  }
}


struct Rectangle2 {
    var width: Int
    var height: Int
    var size: String
    init (width: Int, height: Int){
        self.width = width
        self.height = height
        if width + height <= 10 {
            size = "small"
        } else {
            size = "big"
        }
    }
}
let rectangle = Rectangle2(width: 200, height: 400)
print(rectangle.size)


//-----------------------------//

class Person2 {
  var fullName: String
  init(name: String) {
    self.fullName = name
  }
  func introduce() {
    print("Hi my name is \(self.fullName)")
  }
}
var j = Person2(name: "Ketul Patel") // Initialize a Person object and assign it to the j variable
var k = j                           // Create a k variable and set its value to be the j variable
                                    // (remember classes are reference types)
j.introduce()                       // Prints "Hi my name is Ketul Patel"
k.fullName = "Ketul J Patel"        // We are changing the name through the k variable.
j.introduce()                       // Prints "Hi my name is Ketul J Patel" since both
                                    // j and k refer to the same instance in memory

//---------------//

struct Rectangle3 {
  var width: Int
  var height: Int
}
var square1 = Rectangle3(width: 10, height: 10)
var square2 = square1                         // Here the val inside square 1 (an instance of Rectangle)
                                              // is copied and passed rather than just pointed to.
print("square1's width: \(square1.width), square2's width \(square2.width)")
                                              // They are the same because square2 is a copy of square1
square2.width = 20                            // This only changes square2 because there are
                                              // 2 separate instances of rectangle in memory
square2.height = 20
print("square1's width: \(square1.width), square2's width \(square2.width)")
                                              // They are different now: changing square2 changed a
                                              // completely separate instance from square1.

//------------------//

class Person3 {
  var species = "H. Sapiens"
  var name: String
  init(name: String) {         // Note: this function doesn't get called explicitly.  It is called
                               // when creating an instance using the initialization syntax -- "Person()"
    self.name = name           // Note: the use of "self.name" here to refer to the name property
    // instead of the name parameter
  }
  func speak() {
    print("Hello! I am a \(self.species) and my name is \(self.name)")
                               // Note how we refer to the properties using "self"
  }
}
class Developer: Person3 {      // Note how we are specifying that Developer will inherit from Person
  var favoriteLanguage: String
    init(name: String, favoriteLanguage: String) {    // Note there is no override keyword on init because it has
        // different parameter names then the Person init method
    self.favoriteLanguage = favoriteLanguage
    super.init(name: name)
  }
    override func speak() {                           // Note there is an override keyword on speak because it is
        // identical to the Person speak method
    print("Hello! I am a Developer! My name is \(self.name)")
  }
}
var myDeveloper: Developer = Developer(name: "Jay", favoriteLanguage: "Swift")
myDeveloper.speak()


//------------------------------------//

class Building {
    var health = 100
    
   func takeDamage(_ damage: Int) -> Self { // Note the return type
        health -= damage
        return self                              // Note the returned value is self
    }
}
var building = Building()
building.takeDamage(10).takeDamage(20)

class House: Building {
    var door = "closed"
    
    func openDoor() -> House {
        door = "open"
        return self
    }
}
var house = House()
house.takeDamage(10).openDoor() 









