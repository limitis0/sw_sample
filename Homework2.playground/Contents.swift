import Cocoa

////第一題
//typealias myType1 = (String, String) -> Int
////type define: in this case, myType1 is a function in 2 parameters and return 1 int
//
//func myclosure(clo:myType1) ->String {
//
//    let result_clo = clo("2", "7")
//
//    return result_clo.description
//
//}
//let result = myclosure{num1, num2 -> Int in
//    return Int(num1)! + Int(num2)! // 字符串轉Int Int(String)!
//}
//print("\(result)")

////第二題
////定義列舉錯誤訊息
//enum ErrorMessage1:Error {
//    case zeroError
//    case negativeError
//}
//
//typealias myType2 = (String, String) -> Int
//var num1 = "-1"
//var num2 = "-2"
//func myclosure(str1 : String, str2:String, clo:myType2) throws ->String {
//    guard ((Int(str1) != nil) && (Int(str2) != nil)) else {
//        throw ErrorMessage1.zeroError
//    }
//    guard (Int(str1)! + Int(str2)!) > 0 else {
//        throw ErrorMessage1.negativeError
//    }
//    let result_clo = clo(str1, str2)
//    return result_clo.description
//}
//do{
//    let result = try myclosure(str1: num1, str2: num2) { num1, num2->Int in
//        return Int(num1)! + Int(num2)! // 字符串轉Int Int(String)!
//    }
//    print("輸出為:\(result)")
//}
//catch ErrorMessage1.zeroError{
//    print("兩字串不能轉為整數相加")
//}
//catch ErrorMessage1.negativeError{
//    print("兩字串相加為負數")
//}

//第三題
//定義列舉錯誤訊息
enum ErrorMessage2:Error {
    case AllzeroError
    case basenegativeError
}

class SmyError {
    
    var base:Int = 0
    var exp:Int = 0
    var result:Int = 0
    
    init(){

    }
    func PowerCal(base:Int, exp:Int) throws ->Int {
        guard ((base != 0 ) || (exp != 0)) else { //翟墨跟定理
            throw ErrorMessage2.AllzeroError
        }
        guard (base > 0 ) else {
            throw ErrorMessage2.basenegativeError
        }
        var sum:Int = 1
        for _ in 1...exp {
            sum *= base
        }
    return sum
    }
}

let result1 = SmyError()
var sum : Int = 0
do{
    sum = try result1.PowerCal(base: -1, exp: 2)
    print("計算結果為:\(sum)")}
catch ErrorMessage2.AllzeroError {
    print("錯誤產生,底數與指數皆為零")
}
catch ErrorMessage2.basenegativeError {
    print("錯誤, 底數為負數")
}
//第四題
class mutiledge {
    var linelength : Double = 0
    var anglesum : Int = 0
    var area :Double = 0
    var number:Int = 0
    func findAnglesum()->Int {
        anglesum = (number - 2)*180
        return anglesum;
    }
    func findarea() -> Double {
        return area;
    }
    init(linelength:Double) {
        self.linelength = linelength
    }
}

class Trangle : mutiledge{
    override var number: Int{
        get {
            return super.number
        }
        set{
            super.number = newValue
        }
    }
    override init(linelength:Double) {
        super.init(linelength:linelength)
        super.number = 3
    }
    override func findarea() -> Double {
        area = linelength*linelength*sin(Double.pi/3)/2.0
        return area;
    }
}
class Square : mutiledge{
    override var number: Int{
        get {
            return super.number
        }
        set{
            super.number = newValue
        }
    }
    override init(linelength:Double) {
        super.init(linelength:linelength)
        super.number = 4
    }
    override func findarea() -> Double {
        area = linelength*linelength
        return area;
    }
}
class Pentagon : mutiledge{
    override var number: Int{
        get {
            return super.number
        }
        set{
            super.number = newValue
        }
    }
    override init(linelength:Double) {
        super.init(linelength:linelength)
        super.number = 5
    }
    override func findarea() -> Double {
        area = (5.0*linelength*linelength)/(4.0*tan(Double.pi/180.0*36))
        return area;
    }
}

let trangle = Trangle(linelength: 6)
print("三角形面積為：\(trangle.findarea())")
print("三角形總角度為：\(trangle.findAnglesum())")
let square = Square(linelength: 4)
print("正四邊形面積為：\(square.findarea())")
print("正四邊形總角度為：\(square.findAnglesum())")
let pentagon = Pentagon(linelength:6)
print("正五邊形面積為：\(pentagon.findarea())")
print("正五邊形總角度為：\(pentagon.findAnglesum())")

//第五題
var a1 = 3.0, b1 = 4.0, c1 = 5.0
var area:Double
var isisObtuse:Bool
//輸入三邊長, 輸出三個角度
func findAnglewithEdge(a:Double, b:Double, c:Double)->(Bool,Double) {
    let cosA =  (b*b + c*c - a*a)/(2*b*c)
    let cosB =  (a*a + c*c - b*b)/(2*a*c)
    let cosC =  (a*a + b*b - c*c)/(2*a*b)
    let isObtuse : Bool
    if cosA < 0 || cosB < 0 || cosC < 0 {
        isObtuse = true
    }else{
        isObtuse = false
    }
    let area = a*b*sqrt(1-pow(cosC,2))/2.0
    return (isObtuse,area)
}

(isisObtuse, area) = findAnglewithEdge(a: a1, b: b1, c: c1)

print("此三角形是否為鈍角:\(isisObtuse) 且面積為\(area)")
