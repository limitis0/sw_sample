//
//  ContentView.swift
//  ExPages
//
//  Created by  Ting-Wei Lee on 2020/8/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("書")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color(red: 108/255, green: 112/255, blue: 100/255))
                
            TabView{
                WelcomeView()
                    .tabItem {
                        Image(systemName: "pencil.circle")
                        Text("Welcome")
                    }
                IndexView()
                    .tabItem {
                        Image(systemName: "doc.plaintext")
                        Text("Index")
                    }
                CardView()
                    .tabItem {
                        Image(systemName: "book")
                        Text("Book")
                    }
            }.accentColor(Color(red: 154/255, green: 175/255, blue: 115/255))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
