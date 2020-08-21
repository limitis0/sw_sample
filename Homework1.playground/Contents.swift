import Cocoa

//var str = "Hello, playground"

/*1. 請撰寫一方法(函數)，此方法可以傳入兩陣列(＝維陣列)，並將兩陣列相加後傳出*/
//var arr1 = [[1,2,3],[4,5,6]]
//var arr2 = [[7,8,9],[10,11,12]]
//var sum = [[0,0,0],[0,0,0]]
//
//func Addto2Arr(arr1: [[Int]],arr2: [[Int]])->([[Int]]){
//    var sum = [[0,0,0],[0,0,0]]
//    for i in 0..<arr1.count {
//        for j in 0..<arr1[i].count{
//            sum[i][j] = arr1[i][j] + arr2[i][j]
//        }
//    }
//    return sum;
//}
//sum = Addto2Arr(arr1: arr1, arr2: arr2)
//for i in 0..<sum.count {
//    for j in 0..<sum[i].count{
//        print(String(format:"%4d", arguments:[sum[i][j]]),terminator: "")
//    }
//    print("")
//}
 

/*2. 請撰寫一程式，此程式可以將2-200之間的質數印出*/
//for i in 2...200 {
//    for j in 2 ..< i {
//        if i % j == 0{
//            print("\(i) 不是質數,  ", terminator:"")
//            break
//        }
//    }
//}


/*4. 請撰寫一程式，此程式可以將陣列的內容反轉。例如：10,20,30,40,50 => 50,40,30,20,10*/
//var arr1 = [10,20,30,40,50]
//var reverseArr = [0,0,0,0,0]
//for i in 0 ..< arr1.count {
//    reverseArr[arr1.count - i - 1] = arr1[i]
//}
//for i in reverseArr {
//    print("\(i),  ", terminator:"")
//}
 
/*6. 請撰寫一個方法，此方法傳入一個整數陣列, 並在方法中將此陣列的和，平均值 , 最大值與最小值傳出*/
//var arr1Sample = [10,20,30,40,50]
//var sum = 0
//var mean = 0.0
//var max = 0
//var min = 0
//func sumMeanMaxFunc(input:[Int])->(sum:Int, mean:Double, max:Int, min:Int){
//    var sum = 0
//    var mean = 0.0
//    var max = 0
//    var min = 0
//    max = input[0]
//    min = input[0]
//    for i in input {
//        if i > max {
//            max = i
//        }
//        if i < min {
//            min = i
//        }
//        sum += i
//    }
//    mean = Double(sum)/Double(input.count)
//    return (sum, mean, max, min)
//}
//
//(sum, mean, max, min) = sumMeanMaxFunc(input: arr1Sample)
//print("原陣列為:")
//for i in arr1Sample{
//    print("\(i), ",terminator:"")
//}
//print("此陣列的和為:\(sum), 平均值平均值:\(mean), 最大值:\(max), 最小值:\(min)")

////第七題
//for i in 1...4 {     //總共幾行
//    for _ in 1 ..< 4-i+1 {
//        print(" ", terminator:"")
//    }
//
//    for _ in 1 ..< (2*i) {
//        print("*", terminator:"")
//    }
//    print("")
//}

//第八題
var score = [90,60,100,70,40]
var name = ["Peter","Mary","Jacky","Joe","Sue"]
var nameScore = [String: Int]()
func findMaxsource(score:[Int], name:[String])->[String:Int] {
    var nameScore = [String: Int]()
    var dic = Dictionary(uniqueKeysWithValues: zip(name,score))
    print(dic)   //把字典值印出
    var maxvalue = 0
    for (keyname, valuescore) in dic{
        if valuescore > maxvalue {
            maxvalue = valuescore
            nameScore = [keyname:valuescore]
        }
    }
    return nameScore
}
nameScore = findMaxsource(score: score, name: name)
print("分數最高者姓名與分數為: (\(nameScore)")

//第九題
func bubbleSort<T:Comparable>(arr: inout[T]){
    var flag: Bool
    for i in 0..<arr.count-1 {
        flag = false
        for j in 0..<arr.count-i-1{
            if arr[j] > arr[j+1]{
                flag = true
                let temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
        if flag == false {
            break
        }
    }
}
var arrofInt = [5,3,9,20,7,22,85]
print("還未排序前:")
for i in arrofInt {
    print("\(i), ", terminator: "")
}
bubbleSort(arr: &arrofInt)
print("")
print("排序後:")
for i in arrofInt {
    print("\(i), ", terminator: "")
}
print("")
var arrofString = ["Apple","Peter","Jacky","Joe","John","Kevin"]
print("還未排序前:")
for i in arrofString {
    print("\(i), ", terminator: "")
}
bubbleSort(arr: &arrofString)
print("")
print("排序後:")
for i in arrofString {
    print("\(i), ", terminator: "")
}

//第十題
struct point {
    var x = 0.0
    var y = 0.0
}
let point1 = point(x: 10.0, y: 10.0)
let point2 = point(x: 40.0, y: 50.0)

func twoPointDistance(point1:point,point2:point)->Float {
    let dist = sqrtf(Float((point1.x - point2.x))*Float((point1.x - point2.x)) + Float((point1.y - point2.y))*Float((point1.y - point2.y)))
    return dist
}
let distance = twoPointDistance(point1:point1,point2:point2)
print("兩點距離為:\(distance)")

