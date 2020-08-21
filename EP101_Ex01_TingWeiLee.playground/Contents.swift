import Cocoa
////Q1. Import two arrays, add up and return (V)
//var arr1 = [1,2,3,4]
//var arr2 = [5,6,7,8]
//var arr3 = [0,0,0,0]
//func addUp() {
//    for i in 0..<arr3.count {
//        arr3[i] = arr1[i] + arr2[i]
//    }
//    print("\(arr3)")
//}
//addUp()

////Q2. Print all the prime numbers between 2-200 (V)
//func findPrime(num: Int) -> Bool {
//    var i = 2
//    while i <= Int(sqrt(Double(num))) {
//        if num % i == 0{
//            return false
//        }
//        i += 1
//    }
//    return true
//}
//for num in 2...200 {
//    if findPrime(num: num) == true {
//        print(num)
//    }
//}

////Q3. Generate two random numbers and get the greatest common divisor (V)
//var num1 = Int.random(in: 0...1000)
//var num2 = Int.random(in: 0...1000)
//func gcd(_ num1:Int,_ num2:Int) -> Int {
//    let r = num1 % num2
//    if r != 0 {
//        return gcd(num2, r)
//    } else {
//        return num2
//    }
//}
//let GCD = gcd(num1, num2)
//print("The greatest common divisor is \(GCD)")

////Q4. Reverse the content of the array (V)
//var arr = [3,6,1,2,7]
//var rArr = arr.reversed()
//print(rArr)

////Q5. Generate the three edges of triangle and identify the type of triangle (incorrect ans)
//func buildTri() -> [Int]{
//    var edge1 = Int.random(in: 1...30)
//    var edge2 = Int.random(in: 1...30)
//    var edge3 = Int.random(in: 1...30)
//    let edge = [edge1,edge2,edge3]
//    var isTri = false
//
//    let triEdge = edge.sorted(by:>)
//    let eMax = triEdge[0]
//    let eMid = triEdge[1]
//    let eMin = triEdge[2]
//
//    while isTri == false {
//        if (eMid+eMin)>eMax{
//            if eMin*eMin + eMid*eMid > eMax*eMax{
//                print("obtuse triangle")
//            }else if eMin*eMin + eMid*eMid == eMax*eMax{
//                print("perfect triangle")
//            }else if eMin*eMin + eMid*eMid < eMax*eMax{
//                print("acute triangle")
//            }
//            isTri = true
//        }else{
//            edge1 = Int.random(in: 1...30)
//            edge2 = Int.random(in: 1...30)
//            edge3 = Int.random(in: 1...30)
//        }
//    }
//    return triEdge
//}
//let triAngle = buildTri()
//print(triAngle)

////Q6. Import a Int array and return the sum, ave, max and min (V)
//func arr(inputArr: [Int]){
//    var sum = 0
//    for i in inputArr{
//        sum += i
//    }
//    print("sum = \(sum)")
//    print("average = \(sum/inputArr.count)")
//    print("maximum = \(inputArr.max() ?? 0)")
//    print("minimum = \(inputArr.min() ?? 0)")
//}
//
//let newArr: () = arr(inputArr: [2,4,6,8,10])
//print(newArr)
//
////Q7. Print a * based triangle, gravity to the center (V)
//func star(count:Int){
//    for i in 0..<count{
//        for _ in stride(from: count-1, to: i, by: -1){
//            print("",terminator:" ")
//        }//print space
//        for _ in 0..<(i*2)+1{
//            print("",terminator:"*")
//        }//print stars
//        print("")
//    }
//    print("")
//}
//
//let starTree: () = star(count: 4)
//print("\(starTree)")

////Q8. import two arrays(self-defined) which are student name and score, and return the student with higest score as dict(name,score)(error)
//func champ(arrName: [String],arrScore: [Int]){
//    //find max score and its index
//    let score = arrScore.max()
//    let maxIndex = arrScore.index(after: score!)
//    //get the name through index
//    let name:String = arrName[maxIndex]
//    let higestScore = [name: score]
//    for (name,score) in higestScore{
//        print("(\(name),\(score ?? 0))")
//    }
//}
////var arrName = ["A","B","C","D","E"]
////var arrScore = [20,30,40,50,60]
//let student: () = champ(arrName: ["A","B","C","D","E"], arrScore: [20,30,40,50,60])
//print(student)
//
////Q9. Bubble sort (V)
//func bobbleSort(unsortedArr: inout [Int]){
//    guard unsortedArr.count > 1 else{
//        return
//    }
//    for i in 0..<unsortedArr.count-1 {
//        var exchanged = false
//        for j in 0..<unsortedArr.count-1-i {
//            if unsortedArr[j] > unsortedArr[j+1]{
//                unsortedArr.swapAt(j, j+1)
//                exchanged = true
//            }
//        }
//        if !exchanged {
//            break
//        }
//    }
//}
//var testList = [1,4,6,3,8,12,35,89,57,34,55,24]
//print(testList)
//bobbleSort(unsortedArr: &testList)
//print(testList)
//
////Q10. a method import 2 (x,y), return distence(V)
//
//struct point {
//    var x:Double = 0
//    var y:Double = 0
//}
//func dist() -> (Double){
//    let firstPoint = point(x: 3, y: 6)
//    let secondPoint = point(x: 4, y: 8)
//    let disSquare = (secondPoint.x - firstPoint.x)*(secondPoint.x - firstPoint.x)+(secondPoint.y - firstPoint.y)*(secondPoint.y - firstPoint.y)
//
//    let distence = sqrt(disSquare)
//    return distence
//}
//let distance = dist()
//print(distance)
