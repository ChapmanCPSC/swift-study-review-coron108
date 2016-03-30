//: Playground - noun: a place where people can play

import UIKit

//Syntax Basics
print("Danny Corona") //Do not need semicolon


//Everything is an object
var i = 5
print(i.predecessor())

//Basic Variables
let x = 5
var y = 10

y = x //Can do this 
//x = y <---- Cannot do this

//Basic Function
func hello(name: String)
{
    print("Hello \(name)")
}

//Function Invocation
hello("Bob")

//Basic Class
class Car
{
    var make = ""
    var model = ""
    var year = ""
    
    func carInfo()
    {
        print("Car Info: \(self.make), \(self.model), \(self.year)")
    }
}

//Object Instantiation
var dreamCar = Car()
dreamCar.make = "Nissan"
dreamCar.model = "GTR R35"
dreamCar.year = "2016"
dreamCar.carInfo()

var currentCar = Car()
currentCar.make = "Honda"
currentCar.model = "Accord"
currentCar.year = "1997"
currentCar.carInfo()

//Swift Functions
func divide(x: Double, y: Double) -> Double
{
    return x/y
}

var divExample = divide(10, y: 3)

func exponent(a: Double, b: Double) -> Double
{
    return pow(a, b)
}

var c = exponent(5, b: 3)

//Externalized Parameters
func sum(x: Int, by y: Int) -> Int
{
    return x + y
}

let result = sum(512, by: 512)

func subtract(x: Int, _ y: Int) -> Int
{
    return x - y
}

let result2 = subtract(10, 5)

//Default Parameters
func ryan(language: String = "iOS", classTime: Int = 1)
{
    print("My favorite coding language is \(language).")
    print("Today, our class will be \(classTime) hour(s) long.")
}

ryan()
ryan("Android")
ryan(classTime: 100)
ryan("Objective-C", classTime: 5)

//Variadic Parameters
func addNums(Nums: Int...)
{
    for num in Nums
    {
        var x = 0
        x += num
        print(x)
    }
}

addNums(2, 3)
addNums(5, 10, 15)

//inout Parameters
func nextNum(inout x: Int, inout y: Int)
{
    x = x.successor()
    y = y.successor()
}

var a = 1
var b = 2

nextNum(&a, y: &b)
print(a)
print(b)

//Functions as Values
func multFunctions(func1 : (x: Int, y: Int) -> Int, func2 : (a: Int, b: Int) -> Int) -> Int
{
    let z = func1(x: 3, y: 5) * func2(a: 2, b: 4)
    return z
}


multFunctions(sum, func2: subtract)  //using functions from earlier

//Anonymous Functions

func doMath(theFunction: (x: Int, y: Int) -> Int) -> Int
{
    let mathResult = theFunction(x:25, y: 3)
    return mathResult
}

doMath{(var1, var2) -> Int in
    var1 - var2
}

let anon =
{
    (var1: Int, var2: Int) -> Int in
    return var1 - var2
}

doMath(anon)

//Implicit Variable Declaration
var ab = "HI"

//Explicit Variable Declaration
var xy : String


//Explicit + Initialization 
enum langType
{
    case iOS
    case Android
    case Hexadecimal
}

let lang1 = langType.Android
var lang2 : langType

//Computed Initializers
let rand = random()
var isEven : Bool =
{
    if rand % 2 == 0
    {
        return true
    }
    else
    {
        return false
    }
}()

class facebookFriends
{
    private var _totalFriends = 30
    var totalFriends : Int{
        get{
            return self._totalFriends
        }
        set{
            if newValue < 3
            {
                print("You need more friends")
            }
            else
            {
                self._totalFriends = newValue
            }
        }
    }
}

let fb = facebookFriends()
fb.totalFriends = 2
fb.totalFriends
fb.totalFriends = 10
fb.totalFriends

class Person
{
    var age : Int = 0 {
        willSet {
            print("About to set age to \(newValue)")
        }
        didSet {
            print("Changed age from \(oldValue) to \(self.age)")
        }
    }
}

var p = Person()
p.age = 10


//String Interpolation
let d = "My age is \(p.age)"
for c in d.characters{
    print(c)
}

//Range Type
for i in 1...20
{
    print(i + 1)
}

var range = 5...7
var arr = [5, 6, 7, 5, 7, 6]
//arr[range]

//Tuples
let (something, something2) = (5, "John")
something
something2

for (index, element) in arr.enumerate()
{
    print("The \(index) item is \(element)")
}

func remove(char: Character, fromString phrase : String) -> (numRemoved: Int, newPhrase : String)
{
    var phrase2 = ""
    var count = 0
    
    for c in phrase.characters
    {
        if c == char
        {
            count+=1
        }
        else
        {
            phrase2 += String(c)
        }
    }
    
    return (count, phrase2)
}

let asdf = remove("i", fromString: "iOS")

asdf.numRemoved
asdf.newPhrase
asdf.0
asdf.1
