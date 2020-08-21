import Cocoa
//---cp18: protocal---

////ex01
//protocol FullyNamed{
//    var fullName:String {get}
//}
//struct Person: FullyNamed{
//    var fullName: String
//}
//let Peter = Person(fullName: "Peter Kuo")
//print("name is \(Peter.fullName)")
//
////ex02
//protocol Togglable{
//    mutating func toggle()
//}
//enum OnOffSwitch: Togglable{
//    case off, on
//    mutating func toggle(){
//        switch self {
//        case .off:
//            self = .on
//        case .on:
//            self = .off
//        }
//    }
//}
////ex03
//// 定義一個協定
//protocol SomeOtherProtocol {
//    func method() -> Int
//}
//// 定義一個類別 遵循協定 SomeOtherProtocol
//class OneClass: SomeOtherProtocol {
//    func method() -> Int {
//        return 5566
//    }
//}
//// 定義另一個類別 有一個型別為 SomeOtherProtocol 的常數
//class AnotherClass {
//// 常數屬性 型別為一個協定:SomeOtherProtocol
//    let oneMember: SomeOtherProtocol
//// 建構器有個參數 member 型別為 SomeOtherProtocol
//    init(member: SomeOtherProtocol) {
//        self.oneMember = member
//    }
//}
//// 先宣告一個類別 OneClass 的實體
//let oneInstance = OneClass();
//let twoInstance = AnotherClass(member: oneInstance)
//
//print(twoInstance.oneMember.method())

////委任delegation (ofter use in btn)
////ex04
//// 定義一個協定 遵循這個協定的類別都要實作 attack() 方法
//protocol GameCharacterProtocol {
//    func attack()
//}
//// 定義一個委任協定 將一些其他功能委任給別的實體實作
//protocol GameCharacterProtocolDelegate {
//    func didAttackDelegate()
//}
//// 定義一個類別 表示一個遊戲角色
//class GameCharacter: GameCharacterProtocol {
//
//    var delegate: GameCharacterProtocolDelegate?
//    func attack() {
//        print("攻擊!")
//        delegate?.didAttackDelegate()
//    }
//}
//// 定義一個類別 遵循協定:GameCharacterProtocolDelegate
//// 這個類別生成的實體會被委任其他動作
//class GameCharacterDelegate: GameCharacterProtocolDelegate {
//    func didAttackDelegate() {
//        print("攻擊後的整理工作")
//    }
//}
//let oneChar = GameCharacter()
//let charDelegate = GameCharacterDelegate()
//oneChar.delegate = charDelegate
//oneChar.attack()
//
//// 定義另一個協定 增加一個防禦方法 defend
//protocol GameCharacterDefend {
//    func defend()
//}
//// 定義一個擴展 會遵循新定義的協定 GameCharacterDefend
//extension GameCharacter: GameCharacterDefend {
//// 必須實作這個方法
//    func defend() {
//        print("防禦!")
//    }
//}
//oneChar.defend()
//
//
//// 生成另外兩個實體
//let twoChar = GameCharacter()
//let threeChar = GameCharacter()
//// 宣告一個型別為 [GameCharacterProtocol] 的陣列
//let team:[GameCharacterProtocol]=[oneChar,twoChar,threeChar]
//// 因為都遵循這個協定 所以這個 attack() 方法一定存在可以呼叫
//for member in team {
//    member.attack()
//}
//
//// 定義一個結構 遵循上面兩個定義的協定
//struct OnePerson: Named, Aged {
//    var name: String
//    var age: Int
//}
//
//// 定義一個函式 有一個參數 定義為遵循這兩個協定的型別
//// 所以寫成 : Named & Aged 格式
//func wishHappyBirthday(to celebrator: Named & Aged) {
//    print("生日快樂! \(celebrator.name)")
//    print("\(celebrator.age) 歲囉!")
//}
//let birthdayPerson = OnePerson(name: "Jacky", age: 18)
//wishHappyBirthday(to: birthdayPerson)


////ex05
//// 定義一個協定 有一個 area 屬性 表示面積
//protocol HasArea {
//    var area: Double { get }
//}
//// 定義一個圓的類別 遵循協定:HasArea 所以會有 area 屬性
//class Circle: HasArea {
//    var area: Double
//    init(radius: Double) {
//        self.area = 3.14 * radius * radius
//    }
//}
//// 定義一個國家的類別 遵循協定:HasArea 所以會有 area 屬性
//class Country: HasArea {
//    var area: Double
//    init(area: Double) { self.area = area }
//}
//// 定義一個動物的類別 沒有面積
//class Animal {
//    var legs: Int
//    init(legs: Int) { self.legs = legs }
//}
//// 以上三個類別的實體都可以作為 [AnyObject] 陣列的成員
//let objects: [AnyObject] = [
//Country(area: 243610), Circle(radius: 2.0), Animal(legs: 4)
//]
//// 遍歷這個陣列
//for object in objects {
//// 使用可選綁定來將成員綁定為 HasArea 的實體
//    if let objectWithArea = object as? HasArea {
//// 符合協定 就會綁定成功 也就可以取得 area 屬性
//        print("面積為 \(objectWithArea.area)")
//    } else {
//        // 不符合協定 則是返回 nil
//        print("沒有面積!")
//    }
//}

//---cp19 generic---
////ex01
//// 定義一個將兩個整數變數的值互換的函式
//func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA = a
//    a=b
//    b = temporaryA
//}
//// 宣告兩個整數變數 並當做參數傳入函式
//var oneInt = 12
//var anotherInt = 500
//swapTwoInts(&oneInt, &anotherInt)
//print("互換後的 oneInt 為 \(oneInt)，anotherInt 為 \(anotherInt)")
//
//// 與上面定義的函式功能相同 只是這時互換的變數型別為字串
//func swapTwoStrings(_ a: inout String, _ b: inout String) {
//    let temporaryA = a, a=b
//    b = temporaryA
//}
//
//func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
//    let temporaryA = a
//    a=b
//    b = temporaryA
//}
//// 首先是兩個整數
//var oneInt2 = 12
//var anotherInt2 = 320
//swapTwoValues(&oneInt2, &anotherInt2)
//// 再來是兩個字串
//var oneString = "Hello"
//var anotherString = "world"
//swapTwoValues(&oneString, &anotherString)

////ex02: bubbles
//func bubbleSort<T:Comparable>(arr: inout[T]){
//    var flag: Bool
//    for i in 0..<arr.count-1 {
//        flag = false
//        for j in 0..<arr.count-i-1{
//            if arr[j] > arr[j+1]{
//                flag = true
//                let temp = arr[j]
//                arr[j] = arr[j+1]
//                arr[j+1] = temp
//            }
//        }
//        if flag == false {
//            break
//        }
//    }
//}
//var arrofInt = [5,3,9,20,7,22,85]
//print("還未排序前:")
//for i in arrofInt {
//    print("\(i), ", terminator: "")
//}
//bubbleSort(arr: &arrofInt)
//print("")
//print("排序後:")
//for i in arrofInt {
//    print("\(i), ", terminator: "")
//}
//print("")
//var arrofString = ["Apple","Peter","Jacky","Joe","John","Kevin"]
//print("還未排序前:")
//for i in arrofString {
//    print("\(i), ", terminator: "")
//}
//bubbleSort(arr: &arrofString)
//print("")
//print("排序後:")
//for i in arrofString {
//    print("\(i), ", terminator: "")
//}

