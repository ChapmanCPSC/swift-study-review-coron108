//: Playground - noun: a place where people can play

import UIKit

//Initializing Optionals

var optionalString : Optional<String>
var optionalString2 : String?
print(optionalString)
print(optionalString2)


//Unrwrapping Optionals

func optMethod(something : String?)
{
    print(something!)
}

optMethod("Yay iOS Optionals!")

//Cannot do optMethod(optionalString) because value is nil and will not unwrap

var maybeString : String? = "I wonder what type this is"
maybeString.dynamicType

var forSureAString = maybeString! //unwrapping
forSureAString.dynamicType


var perhapsString : String? = "Xcode is cool"

if perhapsString != nil
{
    perhapsString!.uppercaseString
}

func lowerCase(phrase: String) -> String
{
    return phrase.lowercaseString
}

lowerCase("RAWR")
lowerCase(perhapsString!)


//Comparing Optionals 

var s1 : String! = "WORDS"
var s2 : String? = "words"

s1 == s2

s2 = s2!.uppercaseString

s1 == s2

class CompSci
{
    var className : String?  //can declare variable without initializing it
    
    func classTime()
    {
        print("1 hour")
    }
}

let iOS = CompSci()
iOS.className = "Topics in Computer Science"
iOS.classTime()

var android : CompSci? = nil
android?.classTime()
//Can't do android.ClassTime(), must unwrap first

android?.className?.uppercaseString


//Comparing Optional and non-optional

var str = "hello world"
var optStr : String? = "hello world"

str == optStr  //Unwraps then compares values

optStr = nil

str == optStr

//Comparing optional with another optional

var opt1 : String? = "hi"
var opt2 : String? = nil
opt1 == opt2

opt2 = "hi"
opt1 == opt2

opt1 = nil
opt2 = nil

opt1 == opt2


//Class Methods

class Facebook
{
    class func friendRequest(name : String)
    {
        print("\(name) has requested to be friends")
    }
    
    class func poke(name : String)
    {
        print("\(name) has poked you...what is this 2008?")
    }
}

Facebook.friendRequest("Danny")
Facebook.poke("Danny")

class Quokka
{
    var name : String
    var age : Int
    var happinessLevel : Int
    
    func happy()
    {
        print("I am so happy now")
    }
    
    func sad()
    {
        print("Quokkas are never sad!")
    }

    //failable init same as regular init except added ? token after init and it can return nil
    init?(name : String, age: Int, happiness : Int = 9000)
    {
        self.name = name
        self.age = age
        self.happinessLevel = happiness
        
        if age < 0 || happiness < 1000
        {
            return nil
        }
        
        self.happy()
    }
}

var q = Quokka(name: "Steven", age: 7)
q?.sad()

var negativeQ = Quokka(name: "Alan", age: -2)
negativeQ?.sad()

//Subscripts

class Grades
{
    private var letterGrade = ["A","B", "C", "D", "F"]
    subscript(idx: Int) -> String{
        return letterGrade[idx]
    }
}

let myGrade = Grades()
print("Johnny got an \(myGrade[0]) on the last test")

class Digit {
    
    var num : Int
    
    init(num : Int) {
        self.num = num
        
    }
    
    subscript(idx : Int) -> Int {
        
        get {
            
            let numString = String(num)
            return Int(String(numString.characters[numString.startIndex.advancedBy(idx)]))!
        }
        set {
            
            var originalNumString = String(num)
            
            let range = originalNumString.startIndex.advancedBy(idx)..<originalNumString.startIndex.advancedBy(idx+1)
            
            originalNumString.replaceRange(range, with: String(newValue))
            
            self.num = Int(originalNumString)!
        }
        
    }
}

let digit1 = Digit(num: 90432)
digit1[4]

digit1[3] = 9

digit1

enum Pokemon : Int
{
    case Charmander = 0
    case Charmeleon = 1
    case Charizard = 2
    
    mutating func evolve()
    {
        let newPokemon = Pokemon(rawValue: self.rawValue + 1)
        self = newPokemon!
    }
}

var bob = Pokemon.Charmander
bob.evolve()

//Comparing Structs to Classes

class Superhero
{
    var superName = ""
    var power = ""
}

let hero1 = Superhero()

hero1.superName = "The Raven"

let hero2 = hero1

hero1.superName
hero2.superName

hero2.superName = "Superman"

hero1.superName //changes hero1 name as well as hero2 name (reference type)

struct SuperVillain
{
    var name : String
    var evilPower : String
}

var villain1 = SuperVillain(name: "Dr. Kelvin", evilPower: "FIRE")

var villain2 = villain1
villain2.name = "The Joker"

villain1.name
villain2.name //structs are value types, changing villain2.name has no affect on villain1.name

//Inheritance

class Movies
{
    var name : String
    var runTime : Int
    
    init(name : String, minutes : Int)
    {
        self.name = name
        self.runTime = minutes
    }
    
    convenience init()
    {
        self.init(name : "", minutes : 0)
    }
    
    func watchMovie()
    {
        print("You just watched \(name)")
    }
}

class Action : Movies
{
    final override func watchMovie() {
        super.watchMovie()
        print("Yay! Action movies! Don't you feel pumped that you watched \(name)!")
    }
}

let dieHard = Action(name: "Die Hard", minutes: 132)
dieHard.watchMovie()

class Dinosaur
{
    var type : String = ""
    var name : String = ""
    
    func roar()
    {
        print("RAWR! I'm a dinosaur!")
    }
}

class Velociraptor : Dinosaur
{
    //override var type = "velociraptor"
    
    override func roar()
    {
        super.roar()
        super.roar()
        print("rawr!")
    }
}

let d = Dinosaur()
let v = Velociraptor()

func makeRoar(dino : Dinosaur)
{
    dino.roar()
    
    let velo = dino as? Velociraptor
    
    //    Same as
    //    if velo != nil
    //    {
    //        velo?.roar()
    //    }
    
    velo?.roar()
}

makeRoar(d)
makeRoar(v)

//Protocols

protocol Run
{
    var speed : Int { get }
    func runFaster()
    func slowDown()
}

class Person : Run
{
    var speed : Int = 12
    
    func runFaster() {
        print("Increasing speed to 15 mph")
        speed = 15
    }
    
    func slowDown() {
        print("Decreasing speed to 5 mph")
        speed = 5
    }
}

struct Cheetah : Run
{
    var speed : Int = 60
    
    func runFaster() {
        print("Increasing speed to 70 mph! OMG! I am running so fast!")
    }
    
    func slowDown() {
        print("Decreasing speed to 20 mph")
    }
}

let p = Person()
let chester = Cheetah()

func speedUp(runner: Run)
{
    print("Let's go! Run Faster")
    runner.runFaster()
}

speedUp(p)
speedUp(chester)

//Umbrella Types
func anyObjectFunc(obj : AnyObject) {}
func anyClassFunc(cls : AnyClass) {}
func anyFunc(a : Any) {}

anyObjectFunc("Hello")
anyObjectFunc(p)

anyClassFunc(Person)
anyClassFunc(Superhero)
anyClassFunc(Dinosaur)

anyFunc("")
anyFunc("Hello")
anyFunc(5)
anyFunc(Bool)

extension Int
{
    func addTwo() -> Int
    {
        return self.advancedBy(2)
    }
}

var num : Int = 5
num.addTwo()

//Errors

enum divError : ErrorType
{
    case divisionByZero
}

func division(x : Int, y : Int) throws
{
    if y == 0
    {
        throw divError.divisionByZero
    }
    else
    {
      print(x/y)
    }
}

do {
    try division(6, y: 0)
} catch divError.divisionByZero
{
    print("You can't divde by zero. Silly human!")
}

//Collection Types

//Arrays
var numsArr : [Int] = [1, 2, 3, 4, 5]
numsArr[0]
numsArr.append(6)
numsArr[0...3]

numsArr.contains(4)
numsArr.dropLast()

//Dictionaries
var dict : [Int : String] = [32 : "Bob", 56 : "Danny", 90: "John"]
dict[56]
dict.count

//Flow Control

enum PhoneType
{
    case Apple
    case Samsung
    case Nokia
}

let phone : PhoneType = .Apple

switch phone {
case .Apple:
    print("iPhone!")
    fallthrough
case .Samsung:
    print("Galaxy")
case .Nokia:
    print("Indestuctible phone")
}

//Ternary Operators
let n = 6421
let n2 = (num < 0) ? "negative" : "positive"

//Loops

numsArr

for num in numsArr where num % 2 == 0
{
    print(num)
}

struct Whatever
{
    var someString : String
    var someNum : Int
}

let w1 = Whatever(someString: "hi", someNum: 5)
let w2 = Whatever(someString: "hola", someNum: 31)
let w3 = Whatever(someString: "bonjour", someNum: 432)

let wArr : [Whatever] = [w1, w2, w3]

for w in wArr where w.someNum > 20
{
    print(w.someString)
}

//Labeled Break
let coord = (20, 21)

outer: for x in 0...40
{
    for y in 0...40
    {
        print("(\(x),\(y))")
        if x == coord.0 && y == coord.1
        {
            break outer
        }
    }
}
