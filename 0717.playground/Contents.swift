import Cocoa
////建構器＝初始器
////ex01
//class Fruit{
//    var fruitName: String
//    var theBest: Bool?
//    init(name: String) {
//        fruitName = name
//    }
//}
//var myFruit = Fruit(name: "Apple")
//print(myFruit.fruitName)
//print(myFruit.theBest)
//
//myFruit.theBest = true
//print(myFruit.theBest!)

////ex02: 沒有自定義初始的話初始器會自動產生初始值
//struct Size{
//    var wide = 0.0, height = 0.0
//}
//let otherSize = Size(wide: 2.0, height: 3.0)
//print(otherSize.wide,otherSize.height)

////初始器委託：初始器可呼叫其他初始氣來初始部分項目
////ex03
//struct Size{ //if change to class: Designated initializer for 'Size' cannot delegate (with 'self.init'); did you mean this to be a convenience initializer?
//    var wide = 0.0, height = 0.0
//    init() {
//        self.init(wide: 2.0, height:3.0)
//    }
//    init(wide:Double, height:Double) {
//        self.wide = wide
//        self.height = height
//    }
//}
//var size = Size()
//print(size.wide,size.height)

////繼承父類別指定建構器要加override，便利建構器不用
////預設不會繼承父類別建構器，但：1,子類別沒有定義建構器：自動繼承父類別所有建構器 2,子類別繼承所有父類別的指定建構器：自動繼承所有父類別的便利建構器
////便利建構器：往旁邊呼叫；指定建構器：往上面（父類別的）呼叫
////ex04
//class Father{
//    init() {
//        print("Fater init")
//    }
//    convenience init(name:String){
//        print("father convenience init, name:\(name)")
//        self.init()
//    }//便利建構器一定要指向同類別中的指定建構器
//}
//class Son: Father {
//    override init() {
//        print("son init")
//    }
//}
//var son1 = Son()
//print("round 1 over \n")
//var son2 = Son(name: "son")

////ex04
//class Fruit{
//    var fruitName: String
//
//    init(fruitName: String) {
//        self.fruitName = fruitName
//        print("呼叫Fruit指定建構器, 1 parameter")
//    }
//    convenience init(){
//        print("呼叫Fruit便利建構器, 0 parameter")
//        self.init(fruitName:"Apple")
//    }
//}
//class FavoriteFruit:Fruit{
//    var num:Int
//    init(FavoriteFruit:String, num:Int) {
//        self.num = num
//        print("呼叫FavoriteFruit指定建構器, 1 parameter")
//        super.init(fruitName: "APPLE")
//    }//一定要往上呼叫
//    override convenience init(fruitName: String) {
//        print("呼叫FavoriteFruit便利建構器, 2 parameter")
//        self.init(FavoriteFruit:fruitName,num:1)
//    }//override父類別的指定建構器改寫成子類別的各種建構器，要指向旁的便利建構器或指定建構器
//}

//let myFruit = Fruit()
//print("\(myFruit.fruitName)")
//print("")

//let myFruit2 = Fruit(fruitName: "BANANA")
//print(myFruit2.fruitName)
//print("")

//let appleObj = FavoriteFruit()
//print("\(appleObj.fruitName): \(appleObj.num)")
//print("")

//let kiwiObj = FavoriteFruit(fruitName: "kiwi")
//print("\(kiwiObj.fruitName): \(kiwiObj.num)")
//print("")

//let bananaObj = FavoriteFruit(FavoriteFruit: "banana", num: 5)
//print("\(bananaObj.fruitName): \(bananaObj.num)")
//print("")

//可失敗建構器：（失敗->e.g. missing parameter）init?
