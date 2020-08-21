//
//  ContentView.swift
//  ExPath
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Path(), draw square
        Path() {myPath in
            myPath.move(to: CGPoint(x: 20, y: 20))
            myPath.addLine(to: CGPoint(x: 300, y: 20))
            myPath.addLine(to: CGPoint(x: 300, y: 200))
            myPath.addLine(to: CGPoint(x: 20, y: 200))
            myPath.addLine(to: CGPoint(x: 20, y: 20))
        }
        .stroke(Color.red)
//        closeSubPath()自動連回起點、lineWidth設定線條粗細
        Path() {myPath in
            myPath.move(to: CGPoint(x: 20, y: 20))
            myPath.addLine(to: CGPoint(x: 300, y: 20))
            myPath.addLine(to: CGPoint(x: 300, y: 200))
            myPath.addLine(to: CGPoint(x: 20, y: 200))
            myPath.addLine(to: CGPoint(x: 20, y: 20))
            myPath.closeSubpath()
        }
        .stroke(Color.red, lineWidth: 5)
//        fill()實心
        Path() {myPath in
            myPath.move(to: CGPoint(x: 20, y: 20))
            myPath.addLine(to: CGPoint(x: 300, y: 20))
            myPath.addLine(to: CGPoint(x: 300, y: 200))
            myPath.addLine(to: CGPoint(x: 20, y: 200))
            myPath.addLine(to: CGPoint(x: 20, y: 20))
        }
        .fill(Color.red)
//        a curve line/area: addQuadCurve(to:control:)+stroke/fill
        Path() {myPath in
            myPath.move(to: CGPoint(x: 40, y: 60))
            myPath.addQuadCurve(to: CGPoint(x: 210, y: 60),
                                control: CGPoint(x: 125, y: 0))
        }
        .stroke(Color.red)
        
//        draw a american football
        ZStack{
//            outer ball shape
            Path(){myPath in
                myPath.move(to: CGPoint(x: 40, y: 60))
                myPath.addQuadCurve(to: CGPoint(x: 210, y: 60),
                                    control: CGPoint(x: 125, y: 0))
                myPath.addQuadCurve(to: CGPoint(x: 210, y: 120),
                                    control: CGPoint(x: 240, y: 90))
                myPath.addQuadCurve(to: CGPoint(x: 40, y: 120),
                                    control: CGPoint(x: 125, y: 180))
                myPath.addQuadCurve(to: CGPoint(x: 40, y: 60),
                                    control: CGPoint(x: 10, y: 90))
            }
            .fill(Color.blue)
//            line left
            Path() {myPath in
                myPath.move(to: CGPoint(x: 70, y: 40))
                myPath.addQuadCurve(to: CGPoint(x: 70, y: 140),
                                    control: CGPoint(x: 110, y: 90))
            }
            .stroke(Color.white, lineWidth: 20)
//            line right
            Path() {myPath in
                myPath.move(to: CGPoint(x: 180, y: 40))
                myPath.addQuadCurve(to: CGPoint(x: 180, y: 140),
                                    control: CGPoint(x: 140, y: 90))
            }
            .stroke(Color.white, lineWidth: 20)
        }
//        addArc() draw spirit(?
        Path() { path in
            path.move(to: CGPoint(x: 170, y: 200))
            path.addArc(center: CGPoint(x: 170, y: 200),
                        radius: 150,
                        startAngle: Angle(degrees: 40),
                        endAngle: Angle(degrees: 330),
                        clockwise: false) //define the empty place
        }
        .fill(Color.blue)
//        draw pie chart, offset() emphasis part of pie chart, overlay() add word
        ZStack{
//            lower-right, emphesis, add word
            Path() { path in
                path.move(to: CGPoint(x: 160, y: 200))
                path.addArc(center: CGPoint(x: 160, y: 200),
                            radius: 120,
                            startAngle: Angle(degrees: 0.0),
                            endAngle: Angle(degrees: 110),
                            clockwise: false)
            }
            .fill(Color(.systemYellow))
            .offset(x: 10.0, y: 10.0)//seperate this pie
            .overlay(Text("Aaa")
                        .font(.system(size: 30))
                        .bold()
                        .offset(x: 50, y: -6))//add a word on the pie
//            lower-left
            Path() { path in
                path.move(to: CGPoint(x: 160, y: 200))
                path.addArc(center: CGPoint(x: 160, y: 200),
                            radius: 120,
                            startAngle: Angle(degrees: 110),
                            endAngle: Angle(degrees: 150),
                            clockwise: false)
            }
            .fill(Color(.systemTeal))
//            upper-left
            Path() { path in
                path.move(to: CGPoint(x: 160, y: 200))
                path.addArc(center: CGPoint(x: 160, y: 200),
                            radius: 120,
                            startAngle: Angle(degrees: 150),
                            endAngle: Angle(degrees: 250),
                            clockwise: false)
            }
            .fill(Color(.systemBlue))
//            upper-right
            Path() { path in
                path.move(to: CGPoint(x: 160, y: 200))
                path.addArc(center: CGPoint(x: 160, y: 200),
                            radius: 120,
                            startAngle: Angle(degrees: 250),
                            endAngle: Angle(degrees: 360),
                            clockwise: false)
            }
            .fill(Color(.systemPurple))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
