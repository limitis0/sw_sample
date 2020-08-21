import Cocoa
////Q1.(?)
//let addUp = {(num1: String, num2: String) -> String in return num1 + num2}
//let numbers = addUp("2", "7")
//print(numbers)
//
////Q2(?)
//enum addUpError: Error{
//    case cannotAddUp
//    case negative(String)
//}
//func addUpErr(num1: Int, num2: Int) throws -> Int {
//    if (num1 + num2) < 0 {
//        throw addUpError.negative("sum is negative")
//    }
//    return num1 + num2
//}
//let numbers0 = try addUpErr(num1: 2, num2: 5)
//print(numbers0)
//let numbers1 = try addUpErr(num1: 2, num2: -5)
//print(numbers1)

//Q3.(V)
enum SmyError: Error{
    case bothAreZero(String)
    case bIsNegative(String)
}
func squareNum(a: Double, b: Double) throws -> Double {
    if (a == 0) && (b == 0) {
        throw SmyError.bothAreZero("a and b are 0")
    }
    if b < 0 {
        throw SmyError.bIsNegative("b < 0")
    }
    return pow(a, b)
}
func test(a:Double, b:Double){
    do{
        print("\(a)的\(b)次方為：",try squareNum(a: a, b: b))
    }catch SmyError.bothAreZero("a and b are 0"){
        print("error: a and b are 0")
    }catch SmyError.bIsNegative("b < 0"){
        print("error: b < 0")
    } catch{
        print("error: other error")
    }
}
test(a: 2.0, b: 5.0)
test(a: 2.0, b: -2.0)
test(a: 0.0, b: 0.0)

////Q4
//class RegPolygon{
//    var number:Int
//    func angle(number:Int) -> Int {
//        let angSum = (number-2)*180
//        return angSum
//    }
//    func area(number:Int) -> Double {
//        <#function body#>
//    }
//}

//Q5

