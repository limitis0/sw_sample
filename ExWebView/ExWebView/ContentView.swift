//
//  ContentView.swift
//  ExWebView
//
//  Created by  Ting-Wei Lee on 2020/8/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedSegment = 0
    @State private var websites = ["mobiledev.tw","developer.apple.com"]
    
    var body: some View {
        VStack{
            Picker(selection: $selectedSegment, label: Text("Web Page Picker")){
                ForEach(0..<websites.count, id:\.self){
                    Text(self.websites[$0]).tag($0)
                }
            }.pickerStyle(SegmentedPickerStyle())//default: wheel
            WebView(request: URLRequest(url: URL(string: "https://\(websites[selectedSegment])")!))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
