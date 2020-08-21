//
//  ContentView.swift
//  ExCircular
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct ContentView: View {
//    state for real time circular bar
    @State var progress: CGFloat = 0.0
    var body: some View {
//        circle() unmoveable circuler bar(?
        ZStack{
            Circle()
                .stroke(Color(.systemYellow), lineWidth: 20)
                .frame(width: 250, height: 250, alignment: .center)
            Circle()
                .trim(from: 0.60, to: 0.75)
                .stroke(Color(.lightGray), lineWidth: 20)
                .frame(width: 250, height: 250, alignment: .center)
                .overlay(Text("85%")
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(.gray))
        }
//        moveable circuar bar
        ZStack{
            Circle()
                .stroke(Color(.systemYellow), lineWidth: 20)
                .frame(width: 250, height: 250, alignment: .center)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color(.lightGray), lineWidth: 20)
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(Angle(degrees: -90))//rotate to 12 o'clock
                .overlay(Text("\(Int(progress*100))%")
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(.gray))
        }
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
                self.progress += 0.005
                if self.progress >= 1.0{
//                    timer.invalidate() //stop the progress
                    self.progress = 0 //repeat the progress from the beginning
                }//move by time: set a timer
            }
        }
//        lifebuoy
        ZStack{
            Circle()
                .stroke(Color(.systemYellow), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
            Circle()
                .trim(from: 0.1, to: 0.15)
                .stroke(Color(.white), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
            Circle()
                .trim(from: 0.35, to: 0.4)
                .stroke(Color(.white), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
            Circle()
                .trim(from: 0.6, to: 0.65)
                .stroke(Color(.white), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
            Circle()
                .trim(from: 0.85, to: 0.9)
                .stroke(Color(.white), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
        }
        ZStack{
            Circle()
                .stroke(Color(.systemYellow), lineWidth: 80)
                .frame(width: 200, height: 200, alignment: .center)
            Circle()
                .trim(from: 0.0, to: 0.05)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.1, to: 0.15)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.2, to: 0.25)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.3, to: 0.35)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.4, to: 0.45)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.5, to: 0.55)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.6, to: 0.65)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.7, to: 0.75)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .trim(from: 0.8, to: 0.85)
                .stroke(Color(.white), lineWidth: 20)
                .frame(width: 260, height: 260, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
