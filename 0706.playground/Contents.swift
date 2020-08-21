import UIKit
//while loop
//var n = 1
//var sum = 0
//while n<=20 {
//    sum = sum + n
//    print("while i = \(i), sum = \(sum) ")
//    n = n + 1
//}
//for loop
//var sum = 0
//for i in stride(from: 0, to: 15, by: 3){
//    sum += i
//    print("while i = \(i), sum = \(sum)")
//}
//"..." = ~
//let arr = [1,2,3,4]
//for i in 0...3{
//    print (arr[i])
//}
//for i in arr{
//    print(i)
//}
//key-value
//let dict = ["amy":20,"john":87,"bitch":66]
//for (key,value) in dict {
//    print("\(key): \(value)")
//}
//nest for loop
//for i in 1...3{
//    for j in 1...3{
//        print(String(format: "%2d * %2d = %2d", i,j,i*j))
//    }
//}
//nest while loop
//var i = 1
//while i <= 9 {
//    var j = 1
//    while j<=9 {
//        print(String(format:"%2d * %2d = %2d, ", i,j,i*j),terminator:"")
//        j += 1
//    }
//    print("")
//    i += 1
//}

var evencount = 0
var oddcount = 0
//for i in 1...100{
//    if i % 2 == 0{
//        evencount += i
//    }else{
//        oddcount += i
//    }
//}
//print("evencount = \(evencount)")
//print("oddcount = \(oddcount)")

var randomnum: UInt32
for _ in 1...1000{
    randomnum = arc4random_uniform(1000)+1
    if randomnum % 2 == 0 {
        evencount += 1
    }else{
        oddcount += 1
    }
}
print("evencount = \(evencount)")
print("oddcount = \(oddcount)")



