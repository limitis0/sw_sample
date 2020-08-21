import Cocoa

////enumerationxu,列舉
//enum CPoint{
//    case north, south, west, east
//}
//var directionToHead = CPoint.west
//directionToHead = .north
//
//switch directionToHead {
//case .north:
//    print("North")
//case .east:
//    print("East")
//case .south:
//    print("South")
//case .west:
//    print("South")
//}

////關聯字
//enum mobile{
//    case iOS(String)
//    case Android(String, String)
//    case Windows(String)
//}
//var myMobile = mobile.iOS("iPhone")
//myMobile = .Android("Samsung", "Google")
//
//switch myMobile{
//case .iOS(let mob1):
//    print("use \(mob1)")
//case .Android(let mob2, let mob3):
//    print("use \(mob2), \(mob3)")
//case .Windows(let mob4):
//    print("use \(mob4)")
//}

////隱式指派
////enum WeekDays:Int{
////    case Mon = 1
////    case Tue = 2
////    case Wed = 3
////    case Thu = 4
////    case Fri = 5
////    case Sat = 6
////    case Sun = 7
////}
//enum WeekDays:Int {
//    case Mon = 1,Tue,Wed,Thu,Fri,Sat,Sun//no given value: start from 0
//}
////let today = WeekDays.Tue
////print(today.rawValue)//rawValue: Int, string, float, cannot repeat
//let today = WeekDays(rawValue:2)
//print(today!)

////structure and class
//struct characterStatus{
//    var hp = 10.0
//    var mp = 20.0
//}
//class gameCharacter{
//    var status = characterStatus()
//    var attackSpeed = 1.0
//}
//let someGameCharacter = gameCharacter()
//print("Attack= \(someGameCharacter.attackSpeed)")
//print("Life= \(someGameCharacter.status.hp)")
//someGameCharacter.status.hp = 100
//print("Life= \(someGameCharacter.status.hp)")
////逐一建構器
//let twoCharacterStatus = characterStatus(hp: 200, mp: 150)
//print("twoCharacterStatus: Life=\(twoCharacterStatus.hp), MagicPower=\(twoCharacterStatus.mp)")

//struct status{
//    var hp = 0.0
//    var mp = 0.0
//}
//var characterOne = status(hp: 100, mp: 200)
//var characterTwo = characterOne
//characterTwo.hp = 300
//characterTwo.mp = 400
//print("character 1: hp = \(characterOne.hp), mp = \(characterOne.mp)")
//print("character 2: hp = \(characterTwo.hp), mp = \(characterTwo.mp)")

//class Character{
//    var attackSpeed = 1.0
//}
//var gameCharacterOne = Character()
//var gameCharacterTwo = gameCharacterOne
//print("game Character 1: ats = \(gameCharacterOne.attackSpeed)")
//print("game Character 2: ats = \(gameCharacterTwo.attackSpeed)")
//gameCharacterTwo.attackSpeed = 2.0
//print("fixed game Character 1: ats = \(gameCharacterOne.attackSpeed)")
//print("fixed game Character 2: ats = \(gameCharacterTwo.attackSpeed)")
//var a = 10
//var b = 10

//if a==b {
//    print("value a is value b")
//}else{
//    print("value a is not value b")
//}
//if gameCharacterOne === gameCharacterTwo { //等價於：是否參考到同一個類別實體
//    print("value a is value b")
//}else{
//    print("value a is not value b")
//}

////let: 變成常數結構體，之後就不能再修改值
//struct status{
//    var hp : Double
//    let mp : Double
//}
//var statusOne = status(hp: 100, mp: 200)
//print("status 1: hp = \(statusOne.hp), mp = \(statusOne.mp)")
//statusOne.hp = 300
//print("status 1: hp = \(statusOne.hp), mp = \(statusOne.mp)")
//
//let statusTwo = status(hp: 100, mp: 200)
////statusTwo.hp = 500 //error

////delaied storage: gotta complete some condition to inite the event for create the object
//class DataImport{
//    var fileName = "data.txt"
//}
//class DataManager{
//    lazy var importer = DataImport()//hey this is a delaible property!
//    var data = [String]()//empty array saves string
//}
//let manager = DataManager()
//manager.data.append("one")
//manager.data.append("two")//give the original value after structure
//print(manager.importer.fileName)

//class charater{
//    var hp : Double = 100
//    var def : Double = 300
//    var totalDef : Double {
//        get{// 這段拿掉之後變成唯獨的計算屬性
//            return (def + 0.1*hp)
//        }
//        set(levUp){
//            hp = hp*(1+levUp)
//            def = def*(1+levUp)
//        }
//    }
//}
//let characterOne = charater()
//print("def before levUp: \(characterOne.def)")
//print("def after levUp: \(characterOne.totalDef)")
//characterOne.totalDef = 1
//print("def before levUp 2: \(characterOne.def)")
//print("total def after levUp 2: \(characterOne.totalDef)")

//struct Cubid{
//    var width = 0.0, height = 0.0, tall = 0.0
//    var volumn:Double {
//        return width*height*tall
//    }
//}
//let cubidVolumn = Cubid(width: 4.0, height: 5.0, tall: 6.0)
//print("volumn of cube is:\(cubidVolumn.volumn)")

////計算屬性不佔記憶體空間
//struct square{
//    var width:Double = 10.0
//    var grith:Int = {
//        get {
//            return 4
//        }
//    }
//}
//print("square memory size is: \(MemoryLayout<square>.size)")

//class SomeGame{
//    var hpValue:Double = 100{
//        willSet(hpValue){
//            print("new hp: \(hpValue)")
////            print("new hp: \(newValue)") //no given parameter name, inbuild parameter name: newValue
//        }
//        didSet{//after change hp, print only when older one is bigger
//            if oldValue > hpValue {
//                print("new hp: \(hpValue)")
//            }
//        }
//    }
//}
//let anotherChar = SomeGame()
//anotherChar.hpValue = 20

//struct Reg{
//    static var wid = 20
//    static var hei = 30
//    static var property:String{
//        return "Reg"
//    }
//}
//print(Reg.property)
//print("wid: \(Reg.wid)")
//print("hei: \(Reg.hei)")

//let obj = Reg()//delete"static" and add this line, change Reg underneeth into obj

//class Circle{
//    var radius = 0.0
//    func getArea() -> Double {
//        return radius*radius*3.14
//    }
//    func setRadius(radius:Double) { //add key word mutating:參考，非設定值
////        radius = r
//        self.radius = radius//self:the obj itself
//    }
//}
//let circleObj = Circle()
//circleObj.setRadius(radius: 10)
//let circleArea = circleObj.getArea()
//print(circleArea)
class cCircle{
    var radius = 0.0
    class func printStar() {
        print("******")
    }
    func getArea() -> Double {
        return radius*radius*3.14
    }
    func setRadius(r:Double) {
        radius = r
    }
}
let circleObject = cCircle()
cCircle.printStar()
circleObject.setRadius(r: 10)
let totalArea = circleObject.getArea()
print("\(totalArea)")
