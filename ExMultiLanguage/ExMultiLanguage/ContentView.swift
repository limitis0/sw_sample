//
//  ContentView.swift
//  ExMultiLanguage
//
//  Created by  Ting-Wei Lee on 2020/8/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(NSLocalizedString("Hello, world!", comment: "Hello world"))
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
