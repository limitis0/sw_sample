import Cocoa
////if-else
//let num2 = 100
//if num2 < 20 {
//    print("number < 20")
//}else if num2 < 200{
//    print("20<number<200")
//}else if num2 < 1000{
//    print("200<number<1000")
//}else{
//    print("number>1000")
//}

////switch-case-default, no break is ok
//let signal:String = "Yellow"
//switch signal {
//case "Red":
//    print("Red")
//case "Green":
//    print("Green")
//case"Yellow":
//    print("Yellow")
//default:
//    print("Green")
//}

////stick one and take the other
//let onepoint = (2.2, -2.2)
//switch onepoint {
//case(let x, 0):
//    print("on X, x is \(x)")
//case(0, let y):
//    print("on y, y is \(y)")
//default:
//    print("null")
//}

////fallthrough:以下都成立
//let num = 3
//var str = ""
//switch num {
//case 2,3,5,7,11,13,17,19:
//    str += "Abc"
//    fallthrough
//case 100,200:
//    str += " and d"
//    fallthrough
//default:
//    str += "; abcd"
//}
//print(str)

////setting initial for array list, array weith can adjust
//var IntArr = Array(repeating:0, count: 5)
//print(IntArr)

////SwapAt(): change position
//var a = ["a","b","c"]
//a.swapAt(2, 1)
//print(a)

////2D array
////style 1: arr = [[int]]()
////style 2: arr = Array<Array<Int>>()
//var array2 = Array<Array<Int>>()
//array2.append([4,3,2,1])
//array2.append([1,2,3,4,5,6])
//array2.append([11,22,33])
//for i in 0..<array2.count{
//    for j in 0..<array2[i].count{
//        print("\(array2[i][j]) ",terminator:"")
//    }
//    print("")
//}
////add up two arrays
//var arr1 : [[Double]] = [[1.1,2.2],[3.3,4.4]]
//var arr2 : [[Double]] = [[5.5,6.6],[7.7,8.6]]
//var arr3 : [[Double]] = [[0.0,0.0],[0.0,0.0]]
//for i in 0..<arr3.count{
//    for j in 0..<arr3.count{
//        arr3[i][j] = arr1[i][j] + arr2[i][j]
//        print("\(arr3[i][j]), ",terminator:"")
//    }
//    print("")
//}

////dictionary: kay-value pair: enter key to find value
////var Dict: Dictionary<"a", 1>
////var Dict: ["a": 1, "b":2]
//var scores = ["A":1, "B":2, "C":3]
//var scores = Dictionary<String,Int>()
//scores ["A"] = 1
//scores ["B"] = 2
//scores ["C"] = 3
//
//print("there are \(scores.count) elements in the dictionary")
//for(name, score) in scores{
//    print("\(name), \(score)")
//}
//if let oldValue = scores.updateValue(4, forKey: "D"){
//    print("the old value for D was \(oldValue)")
//}
//for (name, score) in scores{
//    print("\(name), \(score)")
//}
//clear: arr = [:]
//copy: var arr1 = arr2

//zip()-Dictionary(uniqueKeyWithValues: ): combine array to dictionary !!key must be unique!!
//if the length is not match: follow the shorter one
//repeated key: (uniquingKeysWith: +) to remove

//let name = ["A","B","C","D"]
//let num = [1,2,3,4]
//let namenum = zip(name, num)
//let dict = Dictionary(uniqueKeysWithValues: namenum)
//for (na,nu) in dict {
//    print("name : \(na), num : \(nu)")
//}

//set:
//var myset = Set<Int>()
//var myset = Set<String> = ["A","B","C"]
//add value: insert()
//remove value: remove(), removeAll()
//search: contains()

//func name(p:type)->returnType{
//  code
//}

//func message(number:Int){
//    print("abc \(number)")
//}
//message(number: 3)
//message(number: 5)

//func info(name:String, age:Int){
//    print("\(name) is \(age) years old")
//}
//info(name:"dd", age:3)
//info(name:"aa", age:4)
