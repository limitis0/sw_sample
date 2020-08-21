//
//  ContentView.swift
//  ExAlert
//
//  Created by  Ting-Wei Lee on 2020/7/30.
//

import SwiftUI

struct ContentView: View {
    @State var showAlert = false
    @State var colorArray:Array = [255.0, 255.0, 255.0]
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(red: colorArray[0]/255, green: colorArray[1]/255, blue: colorArray[2]/255, opacity: 1))
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            Button(action: {self.showAlert = true}){
                Text("change bg color")
                    .frame(width: 275, height: 100, alignment: .center)
                    .font(.system(size: 20))
                    .background(Color.gray)
                    .padding(.horizontal, 5)
                    .foregroundColor(.white)
                    .border(Color.gray, width: 5)
                    .cornerRadius(20)
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("change bgC"),
                      message: Text("sure to chang bgC into green?"),
                      primaryButton: .default(Text("oh yes"), action: {colorArray = [103.0,139.0,120.0]}),
                      secondaryButton: .default(Text("fuck no"), action: {colorArray = [255.0, 255.0, 255.0]}))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
