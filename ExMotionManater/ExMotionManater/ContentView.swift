//
//  ContentView.swift
//  ExMotionManater
//
//  Created by  Ting-Wei Lee on 2020/8/13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var motion: MotionManager
    
    var body: some View {
        VStack{
//            Text("Magnetometer Data")
            Text("MotionManager: rotation")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(motion: MotionManager())
    }
}
