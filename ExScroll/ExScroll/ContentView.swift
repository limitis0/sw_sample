//
//  ContentView.swift
//  ExScroll
//
//  Created by  Ting-Wei Lee on 2020/8/4.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Image("img_01")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading){
                Text("Book 1")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text("書一")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text("b1")
                    .font(.caption)
                    .foregroundColor(Color(red: 115/255, green: 154/255, blue: 175/255))
            }
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity,
                   alignment: .leading)
            .padding(.horizontal,10)
            .padding(.bottom,10)
        }
        .background(Color(red: 235/255, green: 224/255, blue: 193/255))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(red: 115/255, green: 154/255, blue: 175/255),
                            lineWidth: 2)
        )
        .padding(.all,10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
