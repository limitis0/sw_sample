//
//  ContentView.swift
//  testPie
//
//  Created by  Ting-Wei Lee on 2020/8/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading){
//            Tab
            TabView{
                InputView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Input")
                    }
                ChartView()
                    .tabItem {
                        Image(systemName: "chart.pie")
                        Text("Chart")
                    }
            }.accentColor(Color(.systemTeal))
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
