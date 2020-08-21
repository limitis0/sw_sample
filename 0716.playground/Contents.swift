import UIKit
////chapter 10
////subscript(): the [],(para1 or key) after array or dict
////只讀不寫時（不用get & set）
//struct Multi {
//    let num:Int
//    subscript(index:Int) -> Int {
//        return num * index
//    }
//}
//let mul = Multi(num: 10)
//print("10*3=\(mul[3])")
////when counting, need to use the value
//class Week{
//    var daysArray = ["mon","tue","wed","thu","fri","sat","sun"]
//    subscript(index:Int)->String{
//        get{
//            return daysArray[index]
//        }
//        set(newValue){
//            self.daysArray[index] = newValue
//        }
//    }
//}
//var day = Week()
//print("today is \(day[2])")

//chapter 11 inherit
/*
 mainly used in class, can extend property, method and other features from other class
 the class inherit from other class is called subclass, inherited by other class is called superclass
 */
//class point{
//    var x:Int
//    var y:Int
//
//    func setData(a:Int, b:Int) {
//        x = a
//        y = b
//    }
//    func printData() {
//        print("x = \(x), y = \(y)")
//    }
//    init() {
//        x = 0
//        y = 0
//    }
//}
//let pointObj = point()
//pointObj.printData()
//pointObj.setData(a: 10, b: 20)
//pointObj.printData()

//class QuestionOne{
//    var question: String
//    var answer: String?
//    init() {
//        question = "the question"
//    }
//}
//let someQuestion = QuestionOne()
//someQuestion.answer = "the following answer"
//print(someQuestion.answer!)

//struct Long{
//    var meter:Double
//    init(cm centimeter:Double) {
//        meter = centimeter/100
//    }
//    init(km kilometer:Double) {
//        meter = kilometer*1000
//    }
//}
//let mToCm = Long(cm: 100)
//print("100cm = \(mToCm.meter)m")
//let kmToM = Long(km: 1)
//print("1km = \(kmToM.meter)m")

//struct Color{
//    let red,green,blue:Double
//    init(red r:Double, green g:Double, blue b:Double) {
//        self.red = r
//        self.green = g
//        self.blue = b
//    }
//    init(white:Double) {
//        red = white
//        green = white
//        blue = white
//    }
//}
//var colorOne = Color(red: 1.0, green: 2.0, blue: 3.0)
//var colorTwo = Color(white: 5.0)
//print(colorOne)
//print(colorTwo)
//
//struct SomeNums{
//    let num: Int
//    init(_ n:Int) {
//        num = n
//    }
//}
//var numOne = SomeNums(7)
//print(numOne)

////only struct have this feature: 成員逐一結構器
//struct CharStatus{
//    var hp = 0
//    var mp = 0
//}
//let someoneStatus = CharStatus(hp: 120, mp: 150)
//print("hp=\(someoneStatus.hp), mp=\(someoneStatus.mp)")
//繼承
//class Point{
//    var x:Int
//    var y:Int
//
//    func setData(a:Int, b:Int) {
//        x = a
//        y = b
//    }
//    func printData() {
//        print("x = \(x), y = \(y)")
//    }
//    init() {
//        x = 0
//        y = 0
//    }
//}
//class Line: Point {
//    var x1:Int = 10
//    var y1:Int = 20
//    func printLine() {
//        print("Line is at (\(x),\(y)) and (\(x1),\(y1))")
//    }
//}
//let lineObj = Line() //error comes if Point.init(have parameter)
//print("original point")
//lineObj.printLine()
//lineObj.setData(a:5, b:5)
//lineObj.printLine()

////override methods
//class GameChara{
//    var attackSpeed = 1.5
//    var description:String{
//        return "job description"
//    }
//    func attack(){
//    }
//}
//class Archer: GameChara {
//    var attackRange = 2.5
//}
//class otherHunter: Archer {
//    override func attack() {
//        print("this is the attack from hunter")
//    }
//}
//let hunterOne = otherHunter()
//hunterOne.attack()

////override property observer
//class GameChara{
//    var attackSpeed = 1.5
//    var description:String{
//        return "job description"
//    }
//    func attack(){
//    }
//}
//class Archer: GameChara {
//    var attackRange = 2.5
//}
//class otherHunter: Archer {
//    override func attack() {
//        print("this is the attack from hunter")
//    }
//}
//class AnotherHunter: Archer {
//    override var attackSpeed: Double{
//        get{
//            return 3.0
//        }
//        set{
//            print(newValue)
//        }
//    }
//}
//
//let hunterOne = otherHunter()
//hunterOne.attack()
//let otherAnotherHunter = AnotherHunter()
//print("hunter 1 attack speed = \(hunterOne.attackSpeed)")
//print("otherAnotherHunter attack speed = \(otherAnotherHunter.attackSpeed)")

//property observer(willSet,didSet)
//class GameChara{
//    var attackSpeed = 1.5
//    var description:String{
//        return "job description"
//    }
//    func attack(){
//    }
//}
//class OtherArcher: GameChara {
//    override var attackSpeed: Double{
//        willSet{
//            print("otherArcher(f) willSet")
//        }
//        didSet{
//            print("otherArcher(f) didSet")
//        }
//    }
//}
//class someHunter: OtherArcher {
//    override var attackSpeed: Double{
//        willSet{
//            print("someHunter(s) willSet")
//        }
//        didSet{
//            print("someHunter(s) didSet")
//        }
//    }
//}

//let otherArcher1 = OtherArcher()
//otherArcher1.attackSpeed = 2.0
//print("")
//let someHunter1 = someHunter()
//someHunter1.attackSpeed = 4.0

////super
//class GameChara{
//    var attackSpeed = 1.5
//    var description:String{
//        return "job description"
//    }
//    func attack(){
//    }
//}
//class Archer: GameChara {
//    var attackRange = 2.5
//
//}
//class GoodHunter: Archer {
//    override var description: String{
//        return super.description + "good Hunter"
//        }
//}
//
//let goodHunter = GoodHunter()
