//
//  ContentView.swift
//  ExVibrate
//
//  Created by  Ting-Wei Lee on 2020/8/18.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        Button(action: {
            UIDevice.vibrate()
        }){
            Image(systemName: "iphone.radiowaves.left.and.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIDevice{
    static func vibrate(){
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
