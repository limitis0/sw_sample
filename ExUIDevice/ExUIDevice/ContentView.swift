//
//  ContentView.swift
//  ExUIDevice
//
//  Created by  Ting-Wei Lee on 2020/8/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
//            device info
            let myDevice: UIDevice = UIDevice.current
            print(myDevice.name)
            print(myDevice.systemName)
            print(myDevice.systemVersion)
            print(myDevice.model)
            print(myDevice.localizedModel)
            print(myDevice.identifierForVendor!)
//            device battery
            myDevice.isBatteryMonitoringEnabled = true
            print(myDevice.batteryLevel)
            print(myDevice.batteryState.rawValue)
            myDevice.isBatteryMonitoringEnabled = false
        }){
            HStack{
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                Text("Get Device Info")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
