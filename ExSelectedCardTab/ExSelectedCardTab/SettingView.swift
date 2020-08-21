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
    
    var body: some View {
        
        NavigationView{
            Form{
                Section(header: Text("user name")){
                    TextField("Please Enter Your User Name", text: $UserName)
                }
                
                Section(header: Text("字型設定")){
                    Picker(selection: $displayFontSelected,
                           label: Text("字型選擇\(displayFontSelected)")){
                        ForEach(0..<displayFontType.count, id:\.self){
                            Text(self.displayFontType[$0])
                        }
                    }
                }
                
                Section(header: Text("背景風格")){
                    Toggle(isOn: $IsDeepScheme){
                        Text("深色(\(String(IsDeepScheme)))")
                    }
                }
                
                Section(header: Text("計數器")){
                    Stepper("計數(\(stepperValue))",
                            onIncrement: {stepperValue+=1},
                            onDecrement: {stepperValue-=1})
                }
               
                Section(header: Text("滑桿(\(sliderValue, specifier: "%.2f"))")){
                    Slider(value: $sliderValue, in: 0...1)
                }
            }
        }.navigationBarTitle("Settings 設定")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
