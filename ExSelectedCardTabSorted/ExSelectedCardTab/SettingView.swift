//
//  SettingView.swift
//  ExStorage
//
//  Created by  Ting-Wei Lee on 2020/8/6.
//

import SwiftUI

struct SettingView: View {
    private var displayFontType = [".default",".rounded",".monospaced",".serif"]
    @State var displayFontSelected = 0
    @State var IsDeepScheme = false
    @State var colorArray:Array = [255.0, 255.0, 255.0]
    @State var stepperValue = 0
    @State var sliderValue = 0.0
    
    @AppStorage("UserName") var UserName: String = ""
//    selector
    @AppStorage("showFeatureOnly") var showFeatureOnly = false
    @AppStorage("showPriceLowerThanOnly") var showPriceLowerThanOnly: Int = 10

//    sorted
    @AppStorage("displayOrder") var displayOrder = DisplayOrderType.featureFirst
    
    var body: some View {
        
        NavigationView{
            Form{
                Section(header: Text("user name")){
                    TextField("Please Enter Your User Name", text: $UserName)
                }
//                sorted
                Section(header: Text("書籍排序")){
                    Picker(selection: $displayOrder,
                           label: Text("依據")){
                        ForEach(DisplayOrderType.allCases, id:\.self){
                            orderType in
                            Text(orderType.text)
                        }
                    }
                }
//                selection
                Section(header: Text("只顯示特色書籍")){
                    Toggle(isOn: $showFeatureOnly){
                        Text("否/是：(\(String(showFeatureOnly)))")
                    }
                }
                
                Section(header: Text("價格")){
                    Stepper("只顯示\(showPriceLowerThanOnly)元以下書籍",
                            onIncrement: {showPriceLowerThanOnly+=5},
                            onDecrement: {showPriceLowerThanOnly-=5})
                }
               
//                Section(header: Text("滑桿(\(sliderValue, specifier: "%.2f"))")){
//                    Slider(value: $sliderValue, in: 0...1)
//                }
            }
        }.navigationBarTitle("Settings 設定")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
