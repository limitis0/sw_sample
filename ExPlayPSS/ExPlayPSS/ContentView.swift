//
//  ContentView.swift
//  ExPlayPSS
//
//  Created by  Ting-Wei Lee on 2020/7/28.
//

import SwiftUI

struct ContentView: View {
//     let randomNumber = Int.random(in: 0...2)
    @State var chosen: String = "Go!"
    var body: some View {
        VStack{
            Text(chosen)
                .padding(.all, 10)
                .frame(width: 150, height: 120, alignment: .center)
                .font(.system(size: 30))
            Button(action: {
                let randomNum = Int.random(in: 0...2)
                let choises = ["Paper","Scissors","Stone"]
                chosen = choises[randomNum]
            }){
                Text("Start!")
                    .font(.system(size: 50))
                    .padding(.horizontal, 5)
                    .frame(width: 280, height: 100, alignment: .center)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .border(Color.gray, width: 2)
                    .cornerRadius(10.0)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
