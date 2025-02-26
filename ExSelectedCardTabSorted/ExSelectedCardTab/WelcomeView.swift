//
//  WelcomeView.swift
//  ExStorage
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct WelcomeView: View {
    
    @AppStorage("UserName") var UserName: String = ""
    
    var body: some View {
        VStack{
            Image(systemName: "book.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    Text(UserName.isEmpty ? "" : "Welcome \(UserName)")
                        .font(.title)
                        .foregroundColor(.gray)
                        .offset(x: -80, y: -150))//adjust place: right/up:+
                .padding()
                .foregroundColor(Color(red: 115/255, green: 154/255, blue: 175/255))
            Text("This is a book.\nThis is not a pen.")
                .fontWeight(.heavy)
                .lineSpacing(20)
                .font(.system(size: 28.0))
                .foregroundColor(Color(red: 189/255, green: 203/255, blue: 164/255))
                .frame(width: 275, height: 125, alignment: .center)
                .background(Color(red: 108/255, green: 112/255, blue: 100/255))
                .cornerRadius(10.0)
                .multilineTextAlignment(.center)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
