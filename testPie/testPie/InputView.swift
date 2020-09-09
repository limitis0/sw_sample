//
//  InputView.swift
//  testPie
//
//  Created by  Ting-Wei Lee on 2020/8/25.
//

import SwiftUI

struct InputView: View {
    
    @AppStorage("CocoaSweetBlendNum") var cocoa: String = ""
    @AppStorage("SwingWhiteCoffeeNum") var coffee: String = ""
    @AppStorage("OtherNum") var other: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Cocoa Sweet Blend")){
                TextField("Enter number of cups", text: $cocoa)
            }
            Section(header: Text("Swing White Coffee")){
                TextField("Enter number of cups", text: $coffee)
            }
            Section(header: Text("Other")){
                TextField("Enter number of cups", text: $other)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
