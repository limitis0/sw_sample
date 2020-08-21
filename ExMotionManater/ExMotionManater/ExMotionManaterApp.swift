//
//  ExMotionManaterApp.swift
//  ExMotionManater
//
//  Created by  Ting-Wei Lee on 2020/8/13.
//

import SwiftUI

@main
struct ExMotionManaterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(motion: MotionManager())
        }
    }
}
