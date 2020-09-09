//
//  ChartView.swift
//  testPie
//
//  Created by  Ting-Wei Lee on 2020/8/25.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        VStack {
//            PieChartView
            PieView()
                .padding(.all, 24)
            
//            total numbers of cups and turnover/day
            TotalView()
                .padding(.all, 24)
                
//            title of every colors and each of their numbers
            TableMarkView()
                .padding(.all, 24)
                

        }
    }
}

struct PieView: View {
    @AppStorage("CocoaSweetBlendNum") var cocoa: String = ""
    @AppStorage("SwingWhiteCoffeeNum") var coffee: String = ""
    @AppStorage("OtherNum") var other: String = ""
    var body: some View {
        let cocoaNum: Int = Int(cocoa) ?? 0
        let coffeeNum: Int = Int(coffee) ?? 0
        let otherNum: Int = Int(other) ?? 0
        
        let sum: Int = cocoaNum + coffeeNum + otherNum
        
//        count angle of every type
        let angCocoa: CGFloat = CGFloat(cocoaNum) / CGFloat(sum)
        let angCoffee: CGFloat = CGFloat(coffeeNum) / CGFloat(sum)
                               
        ZStack{
            Circle()
                .trim(from: 0+0.005, to: angCocoa-0.005)
                .stroke(Color(.systemTeal), lineWidth: 50)
                .frame(width: 200, height: 200, alignment: .center)
                .rotationEffect(Angle(degrees: -90))

            Circle()
                .trim(from:angCocoa+0.005, to: angCocoa+angCoffee-0.005)
                .stroke(Color(.systemGreen), lineWidth: 50)
                .frame(width: 200, height: 200, alignment: .center)
                .rotationEffect(Angle(degrees: -90))

            Circle()
                .trim(from: angCocoa+angCoffee+0.005, to: 1-0.005)
                .stroke(Color(.systemYellow), lineWidth: 50)
                .frame(width: 200, height: 200, alignment: .center)
                .rotationEffect(Angle(degrees: -90))

            VStack{
                Text(String(sum))
                    .font(.system(size: 36))
                Text("杯數")
                    .font(.system(size: 24))
                    .fontWeight(.light)
            }.frame(width: 80, height: 50, alignment: .center)
        }
    }
}

struct TotalView: View {
    
    @AppStorage("CocoaSweetBlendNum") var cocoa: String = ""
    @AppStorage("SwingWhiteCoffeeNum") var coffee: String = ""
    @AppStorage("OtherNum") var other: String = ""
    
    var body: some View {
        HStack{
            VStack{
                let cocoaNum: Int = Int(cocoa) ?? 0
                let coffeeNum: Int = Int(coffee) ?? 0
                let otherNum: Int = Int(other) ?? 0
                                
                let sum: Int = cocoaNum + coffeeNum + otherNum
                Text("\(sum)") //get data inserted
                    .font(.system(size: 36))
                    .frame(width: 180, height: 60, alignment: .center)
                    .background(Color.white)
                Text("杯數")
                    .font(.system(size: 24))
                    .fontWeight(.light)
                    .frame(width: 180, height: 40, alignment: .center)
                    .background(Color(red: 220/255,
                                      green: 220/255,
                                      blue: 220/255)
                                )
            }
            .border(Color(red: 220/255,
                           green: 220/255,
                           blue: 220/255),
                     width: 1)
            .cornerRadius(3.0)
    
            VStack{
                Text("17,500") //get data inserted
                    .font(.system(size: 36))
                    .frame(width: 180, height: 60, alignment: .center)
                    .background(Color.white)
                Text("Turnover/day")
                    .font(.system(size: 24))
                    .fontWeight(.light)
                    .frame(width: 180, height: 40, alignment: .center)
                    .background(Color(red: 220/255,
                                      green: 220/255,
                                      blue: 220/255)
                                )
            }
            .border(Color(red: 220/255,
                           green: 220/255,
                           blue: 220/255),
                     width: 1)
            .cornerRadius(3.0)
        }
    }
}
struct TableMarkView: View {
    @AppStorage("CocoaSweetBlendNum") var cocoa: String?
    @AppStorage("SwingWhiteCoffeeNum") var coffee: String?
    @AppStorage("OtherNum") var other: String?
    var body: some View {
        VStack(alignment: .leading){
            Text("Daily Subtotal")
                .foregroundColor(.black)
                .font(.system(size: 24))
                .fontWeight(.light)
                .padding(.bottom)
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color(.systemTeal))
                    .font(.system(size: 16))
                Text("Cocoa Sweet Blend")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                Text("(\(cocoa!) cups)")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 8)
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 16))
                Text("Swing White Coffee")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                Text("(\(coffee!) cups)")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 8)
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(Color(.systemYellow))
                    .font(.system(size: 16))
                Text("Other")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.light)
                Text("(\(other!) cups)")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
