import Cocoa
//cp15: deal with error
//guard:邏輯分支語法，只能寫在函式裡面、必須帶有else語句
////ex01
//func guardTest(age:Int,broughtID:Bool){
////    check ID
//    guard broughtID else {
//        print("take your ID(\(broughtID))")
//        return
//    }
////    check age
//    guard age>=18 else {
//        print("too young(\(age))")
//        return
//    }
//    print("approved(age:\(age), ID:\(broughtID))")
//}
//guardTest(age: 30, broughtID: false)
//print("")
//guardTest(age: 10, broughtID: false)
//print("")
//guardTest(age: 11, broughtID: true)
//print("")
//guardTest(age: 35, broughtID: true)

////ex02
//enum VendingMachingError:Error{
//    case invalidSelection
//    case insufficientFunds(coinsNeeded:Int)
//    case outOfStock
//}
//struct Item {
//    var price:Int
//    var count:Int
//}
//class VendingMachine{
//    var inventory = ["cola":Item(price:25, count:4),
//                     "milk tea":Item(price:30, count:7),
//                     "green tea":Item(price:15, count:11)]
//    var coinsDeposited = 0
//    func dispenseDrink(drink:String) {
//        print("Dispensing \(drink)")
//    }
//    func vend(itemNmae name:String) throws {
//        guard var Item = inventory[name] else {
//            throw VendingMachingError.invalidSelection
//        }
//        guard Item.price <= coinsDeposited else {
//            throw VendingMachingError.insufficientFunds(coinsNeeded: Item.price - coinsDeposited)
//        }
//        coinsDeposited -= Item.price
//        Item.count -= 1
//        inventory[name] = Item
//        dispenseDrink(drink: name)
//    }
//}
//var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 4
//
//do{
//    try vendingMachine.vend(itemNmae: "cola")
//}catch VendingMachingError.invalidSelection{
//    print("no such item")
//}catch VendingMachingError.outOfStock{
//    print("out of stock")
//}catch VendingMachingError.insufficientFunds(let coinsNeeded){
//    print("not enough money, still need \(coinsNeeded) dollors")
//}

////ex03
////use do-catch to catch exception, = try?(chooseable type)
//enum someError:Error{
//    case illegalArg(String)
//    case outOfBounds(Int,Int)
//    case outOfMemory
//}
//func devide(_ num1:Int,_ num2:Int) throws -> Int{
//    if num2 == 0 {
//        throw someError.illegalArg("0 is an invalid devider")
//    }
//    return num1/num2
//}
////var result1 = try devide(20, 10)
////print("20/10 = \(result1)")
////var result2 = try devide(10, 0)
////print("20/0 = \(result2)")
//func test(a:Int, b:Int) {
//    do{
//        print("\(a) devided by \(b):",try devide(a, b))
//    }catch let someError.illegalArg(msg){
//        print("invalid parameter",msg)
//    }catch let someError.outOfBounds(size, index){
//        print("exceed the bound","size = \(size))","index = \(index)")
//    }catch let someError.outOfMemory {
//        print("memory wrong")
//    }catch{
//        print("other error")
//    }
//}
////test(a: 30, b: 0)
//
//var a = try? devide(20,0)
//var b:Int?
//do{
//    b = try devide(20, 0)
//}catch{b = nil}
//print("a = \(a)")
//print("b = \(b)")

////defer{}: run at last
////ex04
//class Foo {
//    var num = 0
//    func foo() -> Int {
//        defer {
//            num += 1
//        }
//        return num
//    }
//}
//let f = Foo()
//print(f.foo())
//print(f.num)
////-----ch15 over-----

////ch12
////failable initializer: init? when no parameter input and could be fail init, use choosible type init(init?) which is allow the parameter to be nil
//class someclass{
//    init() {
//        print("init()")
//    }
//    deinit {
//        print("deinit")
//    }
//}
//var SomeClass : someclass? = someclass()
//SomeClass = nil

////ch13
////ex01
//class a{
//    init() {
//        print("init() called")
//    }
//    deinit {
//        print("deinit() called")
//    }
//}
//var classN: a? = a()
//classN = nil
//var classA : a? = a()
//var classB = classA
//classA = nil
//classB = nil


