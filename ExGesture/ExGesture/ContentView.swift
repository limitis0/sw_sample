//
//  ContentView.swift
//  ExGesture
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct ContentView: View {
    
    var imagesNames: Array = [
        "pika_1",
        "pika_2",
        "pika_3",
        "pika_4"
    ]
//    state for onLongTapGesture()
    @State var currentImg: Int = 0
//    state for onTapGesture(), scaleEffect()
    @State var isPressed = false
//    state for dragGesture()
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
//        dragGesture()
//        onTapGesture(), scaleEffect(): click, jump, turnaround
//        onLongTapGesture(): change color when long tap
        Image(imagesNames[currentImg])
            .resizable()
            .frame(width: 300, height: 300, alignment: .center)
            .scaleEffect(isPressed ? 0.5:2.0)
            .animation(.easeInOut)
            .scaleEffect(isPressed ? 2.0:0.5)
            .animation(.easeInOut)
            .offset(x: self.newPosition.width, y: self.newPosition.height)
            .gesture(DragGesture()
                        .onChanged{ value in
                            self.newPosition = CGSize(
                                width: value.translation.width + self.currentPosition.width,
                                height: value.translation.height + self.currentPosition.height)
                        }
                        .onEnded{value in
                            self.newPosition = CGSize(
                                width: value.translation.width + self.currentPosition.width,
                                height: value.translation.height + self.currentPosition.height)
                            self.currentPosition = self.newPosition
                        }
            )
            .onTapGesture{
                self.isPressed.toggle()
                if currentImg == 0 || currentImg == 2{
                    currentImg = 2 - currentImg
                }else{
                    currentImg = 4 - currentImg
                }
            }
            .onLongPressGesture {
                if currentImg <= 1{
                    currentImg = 1 - currentImg
                }else{
                    currentImg = 5 - currentImg
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
