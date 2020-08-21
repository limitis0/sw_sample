import Cocoa

/*func nameForOut(參數指派給的常數: type){
code
 }
*/
//func printInfo(name: String, age: Int){
//    print("\(name) is \(age) years old")
//}
//printInfo(name: "amy", age: 44)

//code after return will not be run

//func getMinMax(numbers:[Int])->(min:Int,max:Int)?{
//    if numbers.isEmpty{return nil}
//    let sortedNumbers = numbers.sorted()
//    let min = sortedNumbers.first
//    let max = sortedNumbers.last
//    return (min!,max!)
//}
//let arrays = [5,3,2,4,8,7,10]
//let result = getMinMax(numbers: arrays)
//
//let emptyArray = [Int]()
//let result1 = getMinMax(numbers: emptyArray)
////error since: cannot find value, as well as min and max, in empty array
////=>(min:int, max:Int)?{ //add a "?" to tell: the insert might be null
////add "if numbers.isEmpty{return nil}" in the {code}
//print("max: \(String(describing: result1?.max)), min: \(String(describing: result1?.min))")
////print("max: \(result!.max), min: \(result!.min)")

//func sum(from n1:Int, to n2:Int)->Int{//1st name: for outside, 2nd name: for iside
//    var total = 0
//    for i in n1...n2{
//        total += i
//    }
//    return total
//}
//let caculate = sum(from: 1, to: 100)
//print(caculate)
////省略：(n1:Int,_ n2:Int) =>add"_"before variable

////variable parameter:
//func sum(numbers:Int...)->Int{
//    var total = 0
//    for i in numbers{
//        total += i
//    }
//    return total
//}
//let data1 = sum(numbers: 1,3,4,5,6)
//print("data1: \(data1)")
//let data2 = sum(numbers: 2,4,5,6,7,8)
//print("data2: \(data2)")

//func swapInt(_ a: inout Int,_ b: inout Int){
//    let temp = a
//    a = b
//    b = temp
//}
//var a = 10, b = 20
//let swapValue = swapInt(&a, &b)
//print(a,b)
/*
 in C, int a = 10;
 int &b = a;

 =>membery space stores 10 is called a as well as b
*/

////no parameter, no return: ()->() => ()
////variable as function: var name : (type)->type = funcName
////var name = funcName
//func metersToFeet(meters:Double)->Double{
//    return meters*3.28
//}
//func feetToMeters(feets:Double)->Double{
//    return feets*0.3048
//}
//var result1:Double
//var funct1:(Double)->Double = metersToFeet
//result1 = funct1(20)
//print("20 meters is \(result1) Feet.")
//var result2:Double
//var funct2:(Double)->Double = feetToMeters
//result2 = funct2(20)
//print("20 feets is \(result2) Meters")

////nested function: as return to other usage
//func funct1(increment:Bool)->(Int)->Int{
//    func incremental(input:Int)->Int{
//        return input+1
//    }
//    func decremental(input:Int)->Int{
//        return input-1
//    }
//    if increment{
//        return incremental
//    }else{
//        return decremental
//    }
//}
//var number = -5
//let moveToZero = funct1(increment: number<0)
//while number != 0{
//    print("\(number) ", terminator:"")
//    number = moveToZero(number)
//}

//operator functions: can self identify the rules of +,=,/,%,+= nado, only in 2D operator

//closure: annomyous(?) function:
//{(parameter1:type, parameter2:type...) -> returnType in code}
//can use all parameters mentioned exclude default value

//func funct(para: String, closurePara: (String)-> Void){
//    funct(para)
//} //error

//funct1(para: "Hello World", closurePara: {(str: String) in
//    return print(str)
//})//error

////sorted(): not saved to the origional data; sort(): saved to the original data; (by: < or >)
//let numbers = [3,2,1,4,5]
//var a = numbers.sorted(by:{(a: Int, b:Int)->Bool in return a<b})
////[simplified again: ascending type is already (Int,Int)->Bool]=>
//var b = numbers.sorted(by:{(a,b)in return a<b})
//var c = numbers.sorted(by:{(a,b) in a<b})
//var d = numbers.sorted(by:{$0<$1})
//print("sorted Data")
//print("1. ")
//for i in a{
//    print("\(i), ", terminator:"")
//}
//print("\n2. ")
//for i in b{
//    print("\(i), ", terminator:"")
//}
//print("\n3. ")
//for i in c{
//    print("\(i), ", terminator:"")
//}
//print("\n4. ")
//for i in d{
//    print("\(i), ", terminator:"")
//}

////example2:
////func addInts(num1:Int, num2:Int)->Int{
////    return num1 + num2
////}
//func printmessage(_ mathfunction:(Int,Int)->Int,_ a:Int,_ b:Int){
//    print("result: \(mathfunction(a,b))")
//}
////printmessage(addInts,10,20)
//printmessage({(num1:Int, num2:Int)->Int in return num1 + num2}, 10, 20)//mix addInts() in line 150
//printmessage({(num1, num2)->Int in return num1 + num2}, 10, 20)//remove variable type Int
//printmessage({num1, num2 in return num1 + num2}, 10, 20)//remove ()->type
//printmessage({num1, num2 in num1 + num2}, 10, 20)//remove return !!use this one
//printmessage({$0 + $1}, 10, 20)//remove variable
//printmessage(+, 10, 20)//remove {}

////catch value:
//func calculateSquare(forNumber n : Int)->()->Int{ //()-> represent a function which returns Int
//    var square = 1
//    func ans()->Int{
//    square = square * n
//    return square
//    }
//    return ans
//}
//let squareByFive = calculateSquare(forNumber: 5)
//print(squareByFive)
//print(squareByFive())//1*5
//print(squareByFive())//5*5
//print(squareByFive())//25*5
//print(squareByFive())//125*5
//let NumSquareByFive = squareByFive
//print(NumSquareByFive())//625*5

