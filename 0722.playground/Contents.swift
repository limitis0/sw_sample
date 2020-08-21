import Cocoa
//-----cp17: extension-----
//extension type{code}
//extension protocal{code}
//protocal: similar to interface in java

////ex01: basic usage--modify attributes in Double
//extension Double {
//    var km: Double {return self*1000.0}//change to the attribute "km"
//    var m: Double {return self}
//    var cm: Double {return self/100.0}
//}
//let aMarathon = 42.km + 195.m
//print("the full distance of a Marathon is \(aMarathon) meter.")

////ex02: basic usage--modify methods in Int
//extension Int{
//    func repetition(task:() -> Void) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//}
//3.repetition {
//    print("abc") //do (parameter:Int) times of the code here
//}

////ex03: modify the attribute of methods(func) in class
////use when you don't want to write a new class
//extension Int{
//    mutating func square()->Int{
//        self = self * self
//        return self
//    }
//}
//var intOne = 5
//print(intOne.square())

////in struct: cannot use convenient init()
////ex04: init()
//struct GameChara{
//    var hp = 100, mp = 100, name = ""
//}
//extension GameChara{
//    init(name: String) {
//        self.name = name
//        print("new name: \(name)")
//    }
//}
//let charaOne = GameChara(name: "Archer")
//let charaTwo = GameChara(hp: 200, mp: 50, name: "warrior")
//print("\(charaOne.hp),\(charaOne.mp),\(charaOne.name)")
//print("\(charaTwo.hp),\(charaTwo.mp),\(charaTwo.name)")

////can initial subscript
////subscript: a fast method to get/save the value in array/dict. basically using [key]/[index] to define the position of the value wanted to be modified
////ex05
//extension Int {
//    subscript(digitIndex:Int)->Int {
//        var decimalbase = 1
//        for _ in 0..<digitIndex{
//            decimalbase *= 10
//        }
//        return (self/decimalbase)%10
//    }
//}
//print(123456789[0])
//print(123456789[3])

////obj become nested: nested type
////ex06:
//extension Int{
//    enum Kind {
//        case negative, zero, positive
//    }
//    var kind:Kind{
//        switch self{
//        case 0:
//            return .zero
//        case let x where x>0:
//            return .positive
//        default:
//            return .negative
//        }
//    }
//}
//for number in [3,12,0,-4]{
//    print(number.kind)
//}

//-----cp16: type casting-----

////ex01
//class GameChara{
//    var name: String
//    init(name:String) {
//        self.name = name
//    }
//}
//class Archer:GameChara{
//    var intro:String
//    init(name:String, intro:String) {
//        self.intro = intro
//        super.init(name: name)
//    }
//}
//class Warrior:GameChara{
//    var description:String
//    init(name:String, description:String) {
//        self.description = description
//        super.init(name: name)
//    }
//}
//let gameTeam = [Archer(name: "one", intro: "intro of archer1"), Warrior(name: "two", description: "desctiption of warrior"), Archer(name: "three", intro: "intro of archer2")]
//
//var archerCount = 0
//var warriorCount = 0
//for chara in gameTeam{
//    if chara is Archer{
//        archerCount += 1
//    }else if chara is Warrior{
//        warriorCount += 1
//    }
//}
//print("there are \(archerCount) archers and \(warriorCount) warriors")

////downward type casting: use as?(not sure if it can be casting) or as!(sure able to casting)
////ex02
//class GameChara{
//    var name: String
//    init(name:String) {
//        self.name = name
//    }
//}
//class Archer:GameChara{
//    var intro:String
//    init(name:String, intro:String) {
//        self.intro = intro
//        super.init(name: name)
//    }
//}
//class Warrior:GameChara{
//    var description:String
//    init(name:String, description:String) {
//        self.description = description
//        super.init(name: name)
//    }
//}
//let gameTeam = [Archer(name: "one", intro: "intro of archer1"), Warrior(name: "two", description: "desctiption of warrior"), Archer(name: "three", intro: "intro of archer2")]
//
//for chara in gameTeam{
//    if let charOne = chara as? Archer{
//        print("name of Archer: \(charOne.name)")
//        print("introduction: \(charOne.intro)")
//    }else if let charTwo = chara as? Warrior{
//        print("name of Warrior: \(charTwo.name)")
//        print("introduction: \(charTwo.description)")
//    }
//}

////ex03
//class GameChara{
//    var name: String
//    init(name:String) {
//        self.name = name
//    }
//}
//class Archer:GameChara{
//    var intro:String
//    init(name:String, intro:String) {
//        self.intro = intro
//        super.init(name: name)
//    }
//}
//let someObj: [AnyObject] = [Archer(name: "one", intro: "intro of archer1"),Archer(name: "three", intro: "intro of archer2")]
//for obj in someObj as! [Archer]{
////    let charOne = obj as! Archer
//        print("name of Archer: \(obj.name)")
//        print("introduction: \(obj.intro)")
//}

////usage of any
////ex04
//class GameChara{
//    var name: String
//    init(name:String) {
//        self.name = name
//    }
//}
//class Archer:GameChara{
//    var intro:String
//    init(name:String, intro:String) {
//        self.intro = intro
//        super.init(name: name)
//    }
//}
//class Warrior:GameChara{
//    var description:String
//    init(name:String, description:String) {
//        self.description = description
//        super.init(name: name)
//    }
//}
//var things = [Any]() //unknown type: use any for not defined type
//things.append(4.0)
//things.append("hello")
//things.append((3.0, 5.0))
//things.append(Archer(name: "one", intro: "intro 1"))
//things.append({(name:String) -> String in "Hello, \(name)"})
//
//for thing in things{
//    switch thing {
//    case let someThing as Double where someThing > 0:
//        print("float is \(someThing)")
//    case let someThing as String:
//        print("string is \(someThing)")
//    case let (x,y) as (Double,Double):
//        print("tuple is (\(x),\(y))")
//    case let charOne as Archer:
//        print("name of Archer: \(charOne.name); introduction: \(charOne.intro)")
//    case let stringConvert as (String)->String:
//        print(stringConvert("stringConvert"))
//    default:
//        print("value not defined")
//    }
//}

////nested type
////ex05
//struct Poker{
//    enum Suit:String {
//        case spades = "spades", heart = "heart"
//        case diamond = "diamond", clubs = "clibs"
//    }
//    enum Rank:Int{
//        case ace = 1, two, three, four, five, six
//        case seven, eight, nine, ten
//        case jack, queen, king
//    }
//    let rank: Rank, suit: Suit
//    func description() {
//        print("the suit of this card is: \(suit.rawValue)")
//        print("the rank of this card is: \(rank.rawValue)")
//    }
//}
//let poker = Poker(rank: .queen, suit: .heart)
//poker.description()
//
//let diamondsName = Poker.Suit.diamond
//print(diamondsName.rawValue)

////ex06
//class Person{
//    var residence:Residence?
//}
//class Residence{
//    var numberOfNumber = 1
//}
//let A = Person()
//
//if let roomCount = A.residence?.numberOfNumber{//use可選鍊(ch14), 除非非常確定已經鏈結起來
//    print("A have \(roomCount) room/rooms")
//}else{
//    print("cannot get room count")//v
//}
//
//A.residence = Residence()
//let roomcount = A.residence?.numberOfNumber
//print("A have \(roomcount) room/rooms")

////-----cp14: 可選鏈-----
////ex07
//class Person{
//    var newResidence:NewResidence?
//}
//class NewResidence{
//    var rooms = [Room]()
//    var numberOfRooms:Int{
//        return rooms.count
//    }
//    subscript(i:Int)->Room{ //get content from object:Room(name)
//        get{
//            return rooms[i]
//        }
//        set{
//            rooms[i] = newValue
//        }
//    }
//    func printNumOfRooms() {
//        print("there're \(numberOfRooms) rooms")
//    }
//}
//class Room{
//    let name:String
//    init(name:String) {
//        self.name = name
//    }
//}
//let A = Person()
//A.newResidence = NewResidence()
//
//if A.newResidence?.printNumOfRooms() != nil{
//    A.newResidence?.printNumOfRooms()
//}else{
//    print("cannot call function")
//}
//
//let B = Person()
//let BHouse = NewResidence()
//BHouse.rooms.append(Room(name: "living room"))
//BHouse.rooms.append(Room(name: "dining room"))
//BHouse.rooms.append(Room(name: "kitchen"))
//BHouse.rooms.append(Room(name: "bedroom"))
//BHouse.rooms.append(Room(name: "bathroom"))
//B.newResidence = BHouse

//if let firstRoomName = B.newResidence?[3].name{
//    print("name of the room: \(firstRoomName)")
//}else{
//    print("cannot get first room name")
//}
